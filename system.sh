#!/bin/bash

function Uinstall() {
# Install Tools
  echo "install Tools"
  sudo apt-get -y install \
  whois wireshark-qt mc traceroute nmap fping \ # network tools
  ansible sshpass remmina vinagre curl \        # remote tools
  gitg sqlite3 dosbox \                         # development
  openxenmanager mysql-workbench \              # system administration
  lm-sensors gparted \                          # local tools
  gimp vlc qmmp brasero                         # user tools

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

# Install Wine
  echo "install Wine"
  sudo dpkg --add-architecture i386
  wget -nc https://dl.winehq.org/wine-builds/Release.key
  sudo apt-key add Release.key
  sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
  sudo apt-get update
  sudo apt-get install --install-recommends winehq-stable

# Tweaks
  echo "install "
  sudo apt-get -y install compizconfig-settings-manager

# Install indicators
## System sensors
  echo "Install Sensors indicator"
  sudo add-apt-repository ppa:jfi/ppa
  sudo apt-get update
  sudo apt-get install psensor
## Weather
  echo "Install Weather indicator"
  sudo add-apt-repository ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get install my-weather-indicator
## Yandex disk
  echo "Install Yandex Disk"
  wget http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb
  sudo dpkg -i yandex-disk_latest_amd64.deb
  yandex-disk setup
  sudo add-apt-repository ppa:slytomcat/ppa
  sudo apt-get update
  sudo apt-get install yd-tools
}

if [ `cat /etc/issue.net | cut -d' ' -f1` == 'Ubuntu' ]; then
  Uinstall
fi