#!/bin/bash

# Install Tools
sudo apt-get -y install mc traceroute nmap fping ansible sshpass remmina vinagre curl \
  openxenmanager gitg sqlite3 lm-sensors gparted dosbox bumblebee

# Install VirtualBox
sudo apt-get -y install libsdl1.2debian
curl --progress-bar -L -o/tmp/virtualbox.deb https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Ubuntu~xenial_amd64.deb && sudo dpkg -i /tmp/virtualbox.deb

# Install Slack
sudo apt-get -y install libappindicator1
curl --progress-bar -L -o/tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb && sudo dpkg -i /tmp/slack.deb

# Install Atom
curl --progress-bar -L -o/tmp/atom.deb "https://atom.io/download/deb" && sudo dpkg -i /tmp/atom.deb

# Install Telegram
#wget "https://telegram.org/dl/desktop/linux"

# Install Wine
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt-get update
sudo apt-get install --install-recommends winehq-stable

# Tweaks
sudo apt-get -y install compizconfig-settings-manager

# Install indicators
## System sensors
sudo add-apt-repository ppa:jfi/ppa
sudo apt-get update
sudo apt-get install psensor
## Weather
sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get install my-weather-indicator
## Yandex disk
wget http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb
sudo dpkg -i yandex-disk_latest_amd64.deb
yandex-disk setup
sudo add-apt-repository ppa:slytomcat/ppa
sudo apt-get update
sudo apt-get install yd-tools

