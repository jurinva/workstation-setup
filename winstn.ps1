# Must be run with Administrator privileges
# Befor run this script you must allow to run ps scripts "Set-ExecutionPolicy Unresticted"
#

# Enable Windows 10 dark theme
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0

# Install last stable Windows 10 release
if ([System.Environment]::OSVersion.Version.Build -lt 18363) {
  Invoke-WebRequest -Uri Invoke-WebRequest -Uri https://go.microsoft.com/fwlink/?LinkID=799445 -OutFile $env:USERPROFILE\Downloads\Windows10Upgrade9252.exe
  cd $env:USERPROFILE\Downloads
  .\Windows10Upgrade9252.exe
#  restart-computer
} else {
  Write-Host "Your system is aready 18363"
}

# Install chocolate
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Software
choco install -y 7zip
choco install -y googlechrome
choco install -y dbeaver
choco install -y dbforge-mysql-studio-exp
choco install -y filezilla
choco install -y gitahead
choco install -y gitkraken
choco install -y far
choco install -y iperf3
choco install -y kubernetes-cli
choco install -y less
choco install -y microsoft-windows-terminal
choco install -y mysql-cli
choco install -y mysql.workbench
choco install -y nano
choco install -y nmap
choco install -y notepadplusplus
choco install -y slack
choco install -y speedfan
choco install -y telegram.install
choco install -y tortoisesvn
choco install -y totalcommander
choco install -y virtualbox
choco install -y winrar
choco install -y wget
choco install -y windirstat
choco install -y wireshark
choco install -y xming

function Install-SoftWithSettings
{
  # Install wsl
  Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName Microsoft-Windows-Subsystem-Linux
  #restart-computer
  #Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing

  # Install Midnight Commander
  choco install -y mc
  ((Get-Content -path "$env:USERPROFILE\Midnight Commander\ini" -Raw) -replace 'skin=default','skin=xoria256') | Set-Content -Path "$env:USERPROFILE\Midnight Commander\ini"

  # Install MobaXterm
  choco install -y mobaxterm
  #Invoke-WebRequest -Uri https://github.com/dracula/mobaxterm/archive/master.zip -OutFile $env:USERPROFILE\Downloads\mobaxterm-darkula.zip
  #Expand-Archive $env:USERPROFILE\Downloads\mobaxterm-darkula.zip -DestinationPath $env:USERPROFILE\Downloads\mobaxterm-darkula
  ((Get-Content -path $env:USERPROFILE\Documents\MobaXterm\MobaXterm.ini -Raw) -replace 'SkinName3=Windows normal theme','SkinName3=Windows dark theme') | Set-Content -Path $env:USERPROFILE\Documents\MobaXterm\MobaXterm.ini

  # Install docker for Windows only if Virtualbox not installed
  if (Test-Path 'C:\Program Files\Oracle\VirtualBox\VirtualBox.exe') {
    Write-Warning "VirtualBox is installed"
  } else {
    Write-Warning "docker-destop will be installing, you cant use docker-desktop and VirtualBox in the same time"
    choco install docker-desktop -y
  }

  # Install Atom
  choco install atom -y
  iex "$env:LOCALAPPDATA'\atom\bin\apm' install open-terminal-here git-control git-log git-plus tool-bar git-plus-toolbar autocomplete-python kite svn blame ansible-vault markdown-preview-enhanced atom-inline-blame language-powershell atom-jinja2"

  # Install Notepad++ plugins
  Invoke-WebRequest -Uri https://github.com/morbac/xmltools/releases/download/3.0.4.2/XMLTools-3.0.4.2-x64.zip -OutFile $env:USERPROFILE\Downloads\XMLTools-3.0.4.2-x64.zip
  cd $env:USERPROFILE\Downloads\
  unzip.exe XMLTools-3.0.4.2-x64.zip
  copy XMLTools.dll "C:\Program Files\Notepad++\plugins"
}


function Install-ADModule {
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/jurinva/workstation-setup/raw/master/scripts/winstn/Install-ADModule.ps1'))
}

function Install-MiniKube {
  choco install -y minikube
  minikube start --vm-driver=virtualbox
}

function Main {
  Install-SoftWithSettings
}

Main
