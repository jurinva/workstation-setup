Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install microsoft-windows-terminal -y
# Install docker for Windows only if Virtualbox not installed
if (Test-Path 'C:\Program Files\Oracle\VirtualBox\VirtualBox.exe') {
  Write-Warning "VirtualBox is installed"
} else {
  Write-Warning "docker-destop will be installing, you cant use docker-desktop and VirtualBox in the same time"
  choco install docker-desktop -y
}
# Install Atom
choco install atom -y
& $env:LOCALAPPDATA'\atom\bin\apm' install open-terminal-here git-control git-log git-plus tool-bar git-plus-toolbar autocomplete-python kite svn blame ansible-vault markdown-preview-enhanced atom-inline-blame