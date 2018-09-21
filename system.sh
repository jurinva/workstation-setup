#!/bin/bash

function Uinstall() {
# Install Tools
  echo "install Tools"
  sudo apt-get -y install \
  whois wireshark-qt mc traceroute nmap fping iperf iperf3 \            # network tools
  ansible sshpass remmina vinagre curl snmp                             # remote tools
  gitg sqlite3 dosbox \                                                 # development
  python-setuptools python-dev freetds-dev \
  openxenmanager mysql-workbench \                                      # system administration
  lm-sensors gparted gsmartcontrol openssh-server \                                    # local tools
  gimp vlc qmmp brasero                                                 # user tools

# Install Lazarus
  sudo apt-get install libgtk2.0-dev
  curl --progress-bar -L -o/tmp/lazarus.deb "https://datapacket.dl.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/lazarus-project_1.8.4-0_amd64.deb" && sudo dpkg -i /tmp/lazarus.deb
  curl --progress-bar -L -o/tmp/fpc.deb "https://datapacket.dl.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc_3.0.4-3_amd64.deb" && sudo dpkg -i /tmp/fpc.deb
  curl --progress-bar -L -o/tmp/fpc-src.deb "https://netcologne.dl.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc-src_3.0.4-2_amd64.deb" && sudo dpkg -i /tmp/fpc-src.deb /tmp/fpc.deb /tmp/lazarus.deb

# EasyInstall
  sudo easy_install --upgrade pymssql

# Install Chrome
  echo "Install Chrome"
  curl --progress-bar -L -o/tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i /tmp/chrome.deb

# Install Yandex.Browser
  echo "Install Yandex.Browser"
  curl --progress-bar -L https://cache-mskm901.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/ru/beta/Yandex.deb && sudo dpkg -i /tmp/Yandex.deb

# Install VirtualBox
  echo "install VirtualBox"
  sudo apt-get -y install libsdl1.2debian
  curl --progress-bar -L -o/tmp/virtualbox.deb https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Ubuntu~xenial_amd64.deb && sudo dpkg -i /tmp/virtualbox.deb

# Install Slack
  echo "install Slack"
  sudo apt-get -y install libappindicator1
  curl --progress-bar -L -o/tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb && sudo dpkg -i /tmp/slack.deb

# Install Skype
  echo "Install Skype"
  curl --progress-bar -L -o/tmp/skypeforlinux-64.deb "https://go.skype.com/skypeforlinux-64.deb" && sudo dpkg -i /tmp/skypeforlinux-64.deb

# Install Telegram
#  wget "https://telegram.org/dl/desktop/linux"

# Install Atom
  echo "install Atom"
  curl --progress-bar -L -o/tmp/atom.deb "https://atom.io/download/deb" && sudo dpkg -i /tmp/atom.deb

# Install Powershell
  echo "Install Powershell"
  sudo apt install liblttng-ust0
  curl --progress-bar -L -o/tmp/powershell.deb https://github.com/PowerShell/PowerShell/releases/download/v6.0.4/powershell_6.0.4-1.ubuntu.16.04_amd64.deb && sudo dpkg -i /tmp/powershell.deb

# Install Docker CE
  echo "Install Docker CE"
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce
  sudo adduser $USER docker

# Install Draw.io
  echo "Install Draw.io"
  curl --progress-bar -L -o/tmp/drawio.deb https://github.com/jgraph/drawio-desktop/releases/download/v8.8.0/draw.io-amd64-8.8.0.deb && sudo dpkg -i /tmp/drawio.deb

# Install Wine
  echo "install Wine"
  sudo dpkg --add-architecture i386
  wget -nc https://dl.winehq.org/wine-builds/Release.key
  sudo apt-key add Release.key
  sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
  sudo apt-get update
  sudo apt-get -y install --install-recommends winehq-stable

# Tweaks
  echo "install "
  sudo apt-get -y install compizconfig-settings-manager

# Install indicators
## System sensors
  echo "Install Sensors indicator"
  sudo add-apt-repository ppa:jfi/ppa
  sudo apt-get update
  sudo apt-get -y install psensor
## Weather
  echo "Install Weather indicator"
  sudo add-apt-repository ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get -y install my-weather-indicator
## Yandex disk
  echo "Install Yandex Disk"
  wget http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb
  sudo dpkg -i yandex-disk_latest_amd64.deb
  yandex-disk setup
  sudo add-apt-repository ppa:slytomcat/ppa
  sudo apt-get update
  sudo apt-get -y install yd-tools
}

if [ `cat /etc/issue.net | cut -d' ' -f1` == 'Ubuntu' ]; then
  Uinstall
fi