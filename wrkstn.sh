#!/bin/bash

ubuntuversion="16.04"

function github-latest-release() {
  curl --silent "https://api.github.com/repos/$1/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | tr -d "v"
}

function Uinstall() {
# Install Tools
  echo -en "\033[37;1;41m install Tools \033[0m"
  sudo apt-get -y install whois wireshark-qt mc traceroute nmap fping iperf iperf3 zenmap p0f            # network tools
  echo -en "\033[37;1;41m remote tools \033[0m"
  sudo apt-get -y install sshpass remmina vinagre curl snmp
  echo -en "\033[37;1;41m development \033[0m"
  sudo apt-get -y install gitg sqlite3 dosbox python-setuptools python-dev freetds-dev python-redis
  echo -en "\033[37;1;41m sustem administration \033[0m"
  sudo apt-get -y install mysql-workbench
  echo -en "\033[37;1;41m local tools \033[0m"
  sudo apt-get -y install lm-sensors gparted gsmartcontrol openssh-server gtkterm
  echo -en "\033[37;1;41m firmware tools \033[0m"
  sudo apt-get -y install binwalk u-boot-tools
  echo -en "\033[37;1;41m user tools \033[0m"
  sudo apt-get -y install gimp vlc qmmp brasero hplip-gui unrar default-jre icedtea-plugin filezilla dia speedtest-cli

# Install Ansible
  echo -en "\033[37;1;41m Install ansible \033[0m"
  sudo add-apt-repository -y ppa:ansible/ansible && sudo apt update && sudo apt -y install ansible

# Install Gitkraken
  echo -en "\033[37;1;41m Install Gitkraken \033[0m"
  curl --progress-bar -L -o/tmp/gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb" && sudo dpkg -i /tmp/gitkraken.deb

# Install Notepadqq
  echo -en "\033[37;1;41m Install Notepadqq \033[0m"
  sudo add-apt-repository -y ppa:notepadqq-team/notepadqq
  sudo apt-get update
  sudo apt-get -y install notepadqq

# Install VisulaStudio Code
  echo -en "\033[37;1;41m Install VisulaStudio Code \033[0m"
  curl --progress-bar -L -o/tmp/code_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868 && sudo dpkg -i /tmp/code_amd64.deb

# EasyInstall
#  echo -en "\033[37;1;41m Install Python modules \033[0m"
#  sudo easy_install --upgrade pymssql

# Install Chrome
  echo -en "\033[37;1;41m Install Chrome \033[0m"
  curl --progress-bar -L -o/tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i /tmp/chrome.deb

# Install Yandex.Browser
  echo -en "\033[37;1;41m Install Yandex.Browser \033[0m"
  curl --progress-bar -L -ohttps://cache-mskm901.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/ru/beta/Yandex.deb && sudo dpkg -i /tmp/Yandex.deb

# Install VirtualBox
  echo -en "\033[37;1;41m install VirtualBox \033[0m"
  sudo apt-get -y install libsdl1.2debian
  curl --progress-bar -L -o/tmp/virtualbox.deb https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Ubuntu~xenial_amd64.deb && sudo dpkg -i /tmp/virtualbox.deb

# Install Slack
  echo -en "\033[37;1;41m install Slack \033[0m"
  sudo apt-get -y install libappindicator1
  curl --progress-bar -L -o/tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb && sudo dpkg -i /tmp/slack.deb

# Install Skype
  echo -en "\033[37;1;41m Install Skype \033[0m"
  curl --progress-bar -L -o/tmp/skypeforlinux-64.deb "https://go.skype.com/skypeforlinux-64.deb" && sudo dpkg -i /tmp/skypeforlinux-64.deb

# Install Telegram
  echo -en "\033[37;1;41m install Telegram \033[37;1;41m"
  curl --progress-bar -L -o ~/Downloads/telegram.tar.xz https://telegram.org/dl/desktop/linux
  tar -xpJf ./tsetup.tar.xz

# Install Atom
  echo -en "\033[37;1;41m install Atom \033[37;1;41m"
  curl --progress-bar -L -o/tmp/atom.deb "https://atom.io/download/deb" && sudo dpkg -i /tmp/atom.deb

# Install Asbru (new version of pac manager)
  echo -en "\033[37;1;41m install Asbru (Pac) \033[37;1;41m"
  sudo apt -y install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl
  curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
  sudo apt-get install asbru-cm

# Install Dbeaver-ce
  echo -en "\033[37;1;41m install Dbeaver \033[37;1;41m"
  https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb

# Install PAC
#  echo -en "\033[37;1;41m install Pac \033[37;1;41m"
#  sudo apt -y install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
#  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl
#  curl --progress-bar -L -o/tmp/pac.deb http://sourceforge.net/projects/pacmanager/files/pac-4.0/pac-4.5.5.7-all.deb && sudo dpkg -i /tmp/pac.deb

# Install Docker CE
  echo -en "\033[37;1;41m Install Docker CE \033[0m"
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce
  sudo adduser $USER docker

# Install Project Atomic
#  echo -en "\033[37;1;41m Install Project Atomic \033[0m"
#  sudo add-apt-repository ppa:projectatomic/ppa
#  sudo apt-get update
#  sudo apt-get -y podman

# Install Wine
#  echo -en "\033[37;1;41m install Wine \033[0m"
#  sudo dpkg --add-architecture i386
#  wget -nc https://dl.winehq.org/wine-builds/Release.key
#  sudo apt-key add Release.key
#  sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
#  sudo apt-get update
#  sudo apt-get -y install --install-recommends winehq-stable

# Tweaks
  echo -en "\033[37;1;41m install Tweaks \033[0m"
  sudo apt-get -y install compizconfig-settings-manager

# Teamviewer
  echo -en "\033[37;1;41m Install Teamviewer \033[0m"
  sudo apt install qtdeclarative5-controls-plugin qml-module-qtquick-controls qml-module-qtquick-dialogs qtdeclarative5-dialogs-plugin
  curl --progress-bar -L -o/tmp/teamviewer_amd64.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo dpkg -i /tmp/teamviewer_amd64.deb

# Install Sk1
  echo -en "\033[37;1;41m Install Sk1 \033[0m"
  sudo apt -y install python-cups python-renderpm python-reportlab python-reportlab-accel python-wxgtk3.0 python-wxversion
  curl --progress-bar -L -o/tmp/sk1.deb "https://sk1project.net/dc3.php?version=2.0rc3&target=python-sk1-2.0rc3_ubuntu_16.04_amd64.deb " && sudo dpkg -i /tmp/sk1.deb

# Install yEd
  echo -en "\033[37;1;41m Install yEd \033[0m"
  curl --progress-bar -L -o/tmp/yed.sh "https://www.yworks.com/resources/yed/demo/yEd-3.18.2_with-JRE10_64-bit_setup.sh" && bash /tmp/yed.sh

# Install indicators
## System sensors
  echo -en "\033[37;1;41m Install Sensors indicator \033[0m"
  sudo add-apt-repository -y ppa:jfi/ppa
  sudo apt-get update
  sudo apt-get -y install psensor
## Weather
  echo -en "\033[37;1;41m Install Weather indicator \033[0m"
  sudo add-apt-repository -y ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get -y install my-weather-indicator
## Yandex disk
  echo -en "\033[37;1;41m Install Yandex Disk \033[0m"
  curl --progress-bar -L -o/tmp/yandex-disk_latest_amd64.deb http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb && sudo dpkg -i yandex-disk_latest_amd64.deb
  yandex-disk setup
  sudo add-apt-repository -y ppa:slytomcat/ppa
  sudo apt-get update
  sudo apt-get -y install yd-tools
}

function Usettings() {
# Set switch-input-source (or sudo apt install gnome-tweaks and Keyboard & Mouse -> Additional Layout Options -> Switching to another layout -> Alt+Shift
  gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L']"
}

if [ `cat /etc/issue.net | cut -d' ' -f1` == 'Ubuntu' ]; then
  Uinstall
  Usettings
fi
