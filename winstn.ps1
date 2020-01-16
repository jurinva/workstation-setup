if ([System.Environment]::OSVersion.Version.Build -eq 18362) { Write-Host "18362" } else { Write-Host "18363-" }

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Software
choco install -y googlechrome
choco install -y dbeaver
choco install -y filezilla
choco install -y gitahead
choco install -y gitkraken
choco install -y mc
choco install -y microsoft-windows-terminal
choco install -y mysql-cli
choco install -y mysql.workbench
choco install -y notepadplusplus
choco install -y slack
choco install -y telegram.install
choco install -y virtualbox
choco install -y wget
choco install -y wireshark
choco install -y xming

# Install MobaXterm
choco install -y mobaxterm
#Invoke-WebRequest -Uri https://github.com/dracula/mobaxterm/archive/master.zip -OutFile $env:USERPROFILE\Downloads\mobaxterm-darkula.zip
#Expand-Archive $env:USERPROFILE\Downloads\mobaxterm-darkula.zip -DestinationPath $env:USERPROFILE\Downloads\mobaxterm-darkula

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