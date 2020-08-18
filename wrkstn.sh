#!/bin/bash

ubuntuversion="18.04"

tools='whois wireshark-qt mc traceroute nmap fping iperf iperf3 zenmap p0f net-tools sshpass remmina vinagre curl snmp
       install gitg sqlite3 gitk dosbox python-setuptools python-dev freetds-dev python-redis cmake checkinstall gitk subversion rabbitvcs-nautilus nautilus-script-collection-svn
       mysql-workbench
       lm-sensors gparted gsmartcontrol openssh-server gtkterm
       binwalk u-boot-tools
       gimp vlc qmmp brasero hplip-gui unrar default-jre icedtea-plugin filezilla dia speedtest-cli'

function github-latest-release() {
  curl --silent "https://api.github.com/repos/$1/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | tr -d "v"
}

function apt-get-update() {
  if [ `lsb_release -r -s | tr "." ""` -lt 1804 ]; then sudo apt-get update; fi
}

function Uinstall() {
# Install Tools
  echo -e "\e[31m install Tools \\n \e[0m"
  sudo apt-get -y install whois $tools

# Install Ansible
  echo -e "\e[31m Install ansible \\n \e[0m"
  sudo add-apt-repository -y ppa:ansible/ansible && sudo apt update && sudo apt -y install ansible

# Install Gitkraken
  echo -e "\e[31m Install Gitkraken \\n \e[0m"
  curl -L -o/tmp/gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb" && sudo dpkg -i /tmp/gitkraken.deb
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# Install Notepadqq
  echo -e "\e[31m Install Notepadqq \\n \e[0m"
  sudo add-apt-repository -y ppa:notepadqq-team/notepadqq
  sudo apt-get -y install notepadqq

# Install VisulaStudio Code
  echo -e "\e[31m Install VisulaStudio Code \\n \e[0m"
  curl -L -o/tmp/code_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868 && sudo dpkg -i /tmp/code_amd64.deb
  code --install-extension vscode-icons-team.vscode-icons
  code --install-extension eamodio.gitlens
  code --install-extension akamud.vscode-theme-onedark
  code --install-extension emroussel.atom-icons
  code --install-extension ms-vscode.atom-keybindings
  code --install-extension mhutchie.git-graph
  code --install-extension ms-python.python
  code --install-extension vscoss.vscode-ansible
  code --install-extension vscjava.vscode-maven
  code --install-extension marlon407.code-groovy

# EasyInstall
#  echo -e "\e[31m Install Python modules \\n \e[0m"
#  sudo easy_install --upgrade pymssql

# Install Chrome
  echo -e "\e[31m Install Chrome \\n \e[0m"
  curl -L -o/tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i /tmp/chrome.deb

# Install Yandex.Browser
  echo -e "\e[31m Install Yandex.Browser \\n \e[0m"
  curl -L -ohttps://cache-mskm901.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/ru/beta/Yandex.deb && sudo dpkg -i /tmp/Yandex.deb

# Install VirtualBox
  echo -e "\e[31m install VirtualBox \\n \e[0m"
  sudo apt-get -y install libsdl1.2debian
  curl -L -o/tmp/virtualbox.deb https://download.virtualbox.org/virtualbox/6.0.4/virtualbox-6.0_6.0.4-128413~Ubuntu~bionic_amd64.deb && sudo dpkg -i /tmp/virtualbox.deb

# Install Slack
  echo -e "\e[31m install Slack \\n \e[0m"
  sudo apt-get -y install libappindicator1
  curl -L -o/tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb && sudo dpkg -i /tmp/slack.deb

# Install Skype
  echo -e "\e[31m Install Skype \\n \e[0m"
  curl -L -o/tmp/skypeforlinux-64.deb "https://go.skype.com/skypeforlinux-64.deb" && sudo dpkg -i /tmp/skypeforlinux-64.deb

# Install Telegram
  echo -e "\e[31m install Telegram \\n \e[0m"
  curl -L -o ~/Downloads/telegram.tar.xz https://telegram.org/dl/desktop/linux
  tar -xpJf ./tsetup.tar.xz

# Install Atom
  echo -e "\e[31m install Atom \\n \e[0m"
  curl -L -o/tmp/atom.deb "https://atom.io/download/deb" && sudo dpkg -i /tmp/atom.deb
  apm install open-terminal-here git-control git-log git-plus tool-bar git-plus-toolbar autocomplete-python kite svn blame ansible-vault markdown-preview-enhanced atom-inline-blame sort-selected-elements atom-jinja2
# Manuals:
# https://github.com/sydro/atom-ansible-vault

# Install Asbru (new version of pac manager)
  echo -e "\e[31m install Asbru (Pac) \\n \e[0m"
  if [ "XDG_CURRENT_DESKTOP" == "Unity" ]; then sudo apt -y install libgtk2-appindicator-perl; fi
#  if [ "XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]; then sudo apt -y install libgtk2-appindicator-perl; fi
  sudo apt -y install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl
  curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
  sudo apt-get install asbru-cm

# Install Dbeaver-ce
  echo -e "\e[31m install Dbeaver \\n \e[0m"
  curl -L -o/tmp/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb && sudo dpkg -i /tmp/dbeaver.deb

# Install PAC
#  echo -e "\e[31m install Pac \\n \e[0m"
#  sudo apt -y install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
#  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl
#  curl -L -o/tmp/pac.deb http://sourceforge.net/projects/pacmanager/files/pac-4.0/pac-4.5.5.7-all.deb && sudo dpkg -i /tmp/pac.deb

# Install Docker CE
  echo -e "\e[31m Install Docker CE \\n \e[0m"
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  sudo apt-get -y install docker-ce
  sudo adduser $USER docker

# Install kubectl
# Origin: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
  sudo apt-get update && sudo apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubectl

# Install kubernetic
  curl -L -o/tmp/Kubernetic.tar.gz https://kubernetic.s3.amazonaws.com/Kubernetic-2.4.3.tar.gz
  tar -xvzf /tmp/Kubernetic.tar.gz -C ~/bin/

# Install Project Atomic
#  echo -e "\e[31m Install Project Atomic \\n \e[0m"
#  sudo add-apt-repository ppa:projectatomic/ppa
#
#  sudo apt-get -y podman

# Install Wine
#  echo -e "\e[31m install Wine \\n \e[0m"
#  sudo dpkg --add-architecture i386
#  wget -nc https://dl.winehq.org/wine-builds/Release.key
#  sudo apt-key add Release.key
#  sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
#
#  sudo apt-get -y install --install-recommends winehq-stable

# Tweaks
#  echo -e "\e[31m install Tweaks \\n \e[0m"
#  sudo apt-get -y install compizconfig-settings-manager

# Install KeepassXC
  sudo add-apt-repository -y ppa:phoerious/keepassxc && sudo apt -y install keepassxc

# Install Firefox Add-ons
  firefox https://addons.mozilla.org/firefox/downloads/file/1754702/keepassxc_browser-1.4.3-fx.xpi?src=dp-btn-primary

# Teamviewer
  echo -e "\e[31m Install Teamviewer \\n \e[0m"
  sudo apt install qtdeclarative5-controls-plugin qml-module-qtquick-controls qml-module-qtquick-dialogs qtdeclarative5-dialogs-plugin
  curl -L -o/tmp/teamviewer_amd64.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo dpkg -i /tmp/teamviewer_amd64.deb

# Install Sk1
  echo -e "\e[31m Install Sk1 \\n \e[0m"
  sudo apt -y install python-cups python-renderpm python-reportlab python-reportlab-accel python-wxgtk3.0 python-wxversion
  curl -L -o/tmp/sk1.deb "https://sk1project.net/dc3.php?version=2.0rc3&target=python-sk1-2.0rc3_ubuntu_16.04_amd64.deb " && sudo dpkg -i /tmp/sk1.deb

# Install yEd
  echo -e "\e[31m Install yEd \\n \e[0m"
  curl -L -o/tmp/yed.sh "https://www.yworks.com/resources/yed/demo/yEd-3.18.2_with-JRE10_64-bit_setup.sh" && bash /tmp/yed.sh

# Install Evolution
  echo -e "\e[31m Install Evolution \\n \e[0m"
  sudo apt-get install evolution-ews

# Install Pidgin
  echo -e "\e[31m Install Pidgin \\n \e[0m"
  sudo apt -y install libgtk2.0-dev libxss-dev libgtkspell-dev libxml2-dev libgstreamer1.0-dev
  curl -L -o/tmp/pidgin.tar.bz2 "https://downloads.sourceforge.net/project/pidgin/Pidgin/2.13.0/pidgin-2.13.0.tar.bz2?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpidgin%2Ffiles%2FPidgin%2F2.13.0%2Fpidgin-2.13.0.tar.bz2%2Fdownload&ts=1551484603"
  cd /tmp && tar -xjf ./pidgin.tar.bz2 && cd /tmp/pidgin-2.13.0
  ./configure --disable-vv --disable-idn --disable-meanwhile --disable-avahi --disable-dbus --disable-perl --disable-tcl --prefix=/usr
  make
  sudo checkinstall --nodoc --pkgname=pidgin --pkgversion=2.13.0 --pkgarch=amd64 --pkglicense=GPL --maintainer=jurinva@gmail.com -y -D
  mkdir /tmp/window_merge
  cd /tmp/window_merge
  git clone https://github.com/jurinva/window_merge
  cd window_merge
  mkdir m4
  autoreconf -fi
  ./configure --prefix=$HOME/.purple/plugins
  make

# Install indicators
## System sensors
  echo -e "\e[31m Install Sensors indicator \\n \e[0m"
  sudo apt-get -y install psensor
## Weather
  echo -e "\e[31m Install Weather indicator \\n \e[0m"
  sudo add-apt-repository -y ppa:atareao/atareao

  sudo apt-get -y install my-weather-indicator
## Yandex disk
  echo -e "\e[31m Install Yandex Disk \\n \e[0m"
  curl -L -o/tmp/yandex-disk_latest_amd64.deb http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb && sudo dpkg -i yandex-disk_latest_amd64.deb
  yandex-disk setup
  sudo add-apt-repository -y ppa:slytomcat/ppa

  sudo apt-get -y install yd-tools

# Install Firefox Add-ons
  firefox https://addons.mozilla.org/firefox/downloads/file/1754702/keepassxc_browser-1.4.3-fx.xpi?src=dp-btn-primary

# Ubuntu 16.04 dark theme
  sudo add-apt-repository ppa:noobslab/themes
  sudo apt-get update
  if [ $(lsb_release -r | awk '{ print $2 }') == '16.04' ]; then
    sudo apt-get install arc-theme
    sudo apt-get install arc-flatabulous-theme
#  gsettings set org.gnome.desktop.interface gtk-theme "Arc-Flatabulous-Dark"
#  gsettings set org.gnome.desktop.interface icon-theme 'YourIconTheme'
#  gsettings set org.gnome.desktop.wm.preferences theme "YourWindowTheme"
  else
    sudo apt-get install plane-theme
    gsettings set org.gnome.desktop.interface gtk-theme "Plane-dark"
  fi

# Gitk dark theme
  curl -L -o/tmp/gitk.zip https://github.com/dracula/gitk/archive/master.zip
  unzip /tmp/gitk.zip
  mv /tmp/gitk-master/gitk ~/.config/git/gitk

# Geany dark theme
  mkdir ~/.config/geany/colorschemes/
  curl -L -o ~/.config/geany/colorschemes/darcula.conf https://raw.github.com/geany/geany-themes/master/colorschemes/darcula.conf
  sed -i 's/color_scheme=/color_scheme=darcula.conf/g' ~/.config/geany/geany.conf

# Midnight Commander dark theme
  sed -i 's/skin=default/skin=xoria256/g' ~/.config/mc/ini

}

function Usettings() {
## Set switch-input-source (or sudo apt install gnome-tweaks and Keyboard & Mouse -> Additional Layout Options -> Switching to another layout -> Alt+Shift
  gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L']"
## Set key like Insert
  # echo 'xmodmap -e "keycode 64 = Insert"' >> ~/.bashrc
## Install Russian Language
  sudo apt install language-pack-ru language-pack-ru-base language-pack-gnome-ru language-pack-gnome-ru-base thunderbird-locale-ru hunspell-ru hyphen-ru libreoffice-l10n-ru firefox-locale-ru gnome-getting-started-docs-ru libreoffice-help-ru mythes-ru gnome-user-docs-ru aspell-ru gimp-help-ru gimp-help-en
## Ansible settings
  echo 'export ANSIBLE_HOST_KEY_CHECKING=False' >> ~/.bashrc
}

if [ `cat /etc/issue.net | cut -d' ' -f1` == 'Ubuntu' ]; then
  Uinstall
  Usettings
fi
