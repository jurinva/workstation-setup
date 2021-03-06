#!/bin/bash

ubuntuversion="16.04"

function github-latest-release() {
  curl --silent "https://api.github.com/repos/$1/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | tr -d "v"
}

function Uinstall() {
# Install Tools
  echo "install Tools \\n \e[0m"
  sudo apt-get -y install \
  whois wireshark-qt mc traceroute nmap fping iperf iperf3 zenmap p0f \            # network tools
  sshpass remmina vinagre curl snmp \                                      # remote tools
  gitg gitk subversion rabbitvcs-nautilus nautilus-script-collection-svn sqlite3 dosbox arduino \                                                    # development
  python-setuptools python-dev freetds-dev python-redis \
  mysql-workbench gvncviewer \                                      # system administration
  lm-sensors gparted gsmartcontrol openssh-server gtkterm \                        # local tools
  binwalk u-boot-tools \                                                           # firmware tools
  gimp vlc qmmp brasero hplip-gui winetricks unrar default-jre icedtea-plugin \    # user tools
  stellarium filezilla dia speedtest-cli

# Install Ansible
  echo "Install ansible"
  sudo add-apt-repository ppa:ansible/ansible && sudo apt update && sudo apt -y install ansible

# Install Gitkraken
  echo -e "\e[31m Install Gitkraken \\n \e[0m"
  curl --progress-bar -L -o/tmp/gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb" && sudo dpkg -i /tmp/gitkraken.deb

# Install Celestia
  echo "Install Celestia"
  sudo apt -y install liblua5.1-0
# May be that packages will be needed freeglut3 libgtkglext1 libgnome2-0 libgnomeui-0
  curl --progress-bar -L -o/tmp/celestia-common.deb http://nux87.free.fr/script-postinstall-ubuntu/deb/celestia-common1.6.1all.deb
  curl --progress-bar -L -o/tmp/celestia-gnome.deb http://nux87.free.fr/script-postinstall-ubuntu/deb/celestia-gnome1.6.1amd64.deb
  dpkg -i celestia*
  sudo apt install celestia-common-nonfree

# Install Lazarus
  echo -e "\e[31m Install Lazarus \\n \e[0m"
  sudo apt-get install libgtk2.0-dev
  curl --progress-bar -L -o/tmp/lazarus.deb "https://datapacket.dl.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/lazarus-project_1.8.4-0_amd64.deb" && sudo dpkg -i /tmp/lazarus.deb
  curl --progress-bar -L -o/tmp/fpc.deb "https://datapacket.dl.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc_3.0.4-3_amd64.deb" && sudo dpkg -i /tmp/fpc.deb
  curl --progress-bar -L -o/tmp/fpc-src.deb "https://netcologne.dl.sourceforge.net/project/lazarus/Lazarus%20Linux%20amd64%20DEB/Lazarus%201.8.4/fpc-src_3.0.4-2_amd64.deb" && sudo dpkg -i /tmp/fpc-src.deb /tmp/fpc.deb /tmp/lazarus.deb

# EasyInstall
  echo -e "\e[31m Install Python modules \\n \e[0m"
  sudo easy_install --upgrade pymssql

# Install Chrome
  echo -e "\e[31m Install Chrome \\n \e[0m"
  curl --progress-bar -L -o/tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i /tmp/chrome.deb

# Install Yandex.Browser
  echo -e "\e[31m Install Yandex.Browser \\n \e[0m"
  curl --progress-bar -L -ohttps://cache-mskm901.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/ru/beta/Yandex.deb && sudo dpkg -i /tmp/Yandex.deb

# Install VirtualBox
  echo -e "\e[31m install VirtualBox \\n \e[0m"
  sudo apt-get -y install libsdl1.2debian
  curl --progress-bar -L -o/tmp/virtualbox.deb https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Ubuntu~xenial_amd64.deb && sudo dpkg -i /tmp/virtualbox.deb

# Install VisulaStudio Code
  echo -e "\e[31m Install VisulaStudio Code \\n \e[0m"
  curl --progress-bar -L -o/tmp/code_amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868 && sudo dpkg -i /tmp/code_amd64.deb
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

# Install Slack
  echo -e "\e[31m install Slack \\n \e[0m"
  sudo apt-get -y install libappindicator1
  curl --progress-bar -L -o/tmp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb && sudo dpkg -i /tmp/slack.deb

# Install Skype
  echo -e "\e[31m Install Skype \\n \e[0m"
  curl --progress-bar -L -o/tmp/skypeforlinux-64.deb "https://go.skype.com/skypeforlinux-64.deb" && sudo dpkg -i /tmp/skypeforlinux-64.deb

# Install Telegram
  echo -e "\e[31m install Telegram \e[31m"
  curl --progress-bar -L -o ~/Downloads/telegram.tar.xz https://telegram.org/dl/desktop/linux

# Install Atom
  echo -e "\e[31m install Atom \e[31m"
  curl --progress-bar -L -o/tmp/atom.deb "https://atom.io/download/deb" && sudo dpkg -i /tmp/atom.deb
  apm install open-terminal-here git-control git-log git-plus tool-bar git-plus-toolbar autocomplete-python kite svn blame ansible-vault markdown-preview-enhanced atom-inline-blame

# Install Asbru (new version of pac manager)
  curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
  sudo apt-get install asbru-cm

# Install PAC
#  echo -e "\e[31m install Pac \e[31m"
#  sudo apt install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
#  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl
#  curl --progress-bar -L -o/tmp/pac.deb http://sourceforge.net/projects/pacmanager/files/pac-4.0/pac-4.5.5.7-all.deb && sudo dpkg -i /tmp/pac.deb


# Install Powershell
  echo -e "\e[31m Install Powershell \e[31m"
  sudo apt install liblttng-ust0
  githubrepo="PowerShell/PowerShell"
  githubrelease=$(github-latest-release $githubrepo) #(v.6.0.4)
  curl --progress-bar -L -o/tmp/powershell.deb https://github.com/$githubrepo/releases/download/v$githubrelease/powershell_$githubrelease-1.ubuntu.$ubuntuversion_amd64.deb && sudo dpkg -i /tmp/powershell.deb

# Install Docker CE
  echo -e "\e[31m Install Docker CE \\n \e[0m"
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get -y install docker-ce
  sudo adduser $USER docker

# Install kubectl
# Origin: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
  sudo apt-get update && sudo apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubectl

# Install Project Atomic
  echo -e "\e[31m Install Project Atomic \\n \e[0m"
  sudo add-apt-repository ppa:projectatomic/ppa
  sudo apt-get update
  sudo apt-get -y podman

# Install Draw.io
  echo -e "\e[31m Install Draw.io \\n \e[0m"
  githubrepo="jgraph/drawio-desktop"
  githubrelease=$(github-latest-release $githubrepo) #(v.8.8.0)
  curl --progress-bar -L -o/tmp/drawio.deb https://github.com/$githubrepo/releases/download/v$githubrelease/draw.io-amd64-$githubrelease.deb && sudo dpkg -i /tmp/drawio.deb

# Install Wine
  echo -e "\e[31m install Wine \\n \e[0m"
  sudo dpkg --add-architecture i386
  wget -nc https://dl.winehq.org/wine-builds/Release.key
  sudo apt-key add Release.key
  sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
  sudo apt-get update
  sudo apt-get -y install --install-recommends winehq-stable

# Install Sk1
  echo -e "\e[31m Install Sk1 \\n \e[0m"
  sudo apt -y install python-cups python-renderpm python-reportlab python-reportlab-accel python-wxgtk3.0 python-wxversion
  curl --progress-bar -L -o/tmp/sk1.deb "https://sk1project.net/dc3.php?version=2.0rc3&target=python-sk1-2.0rc3_ubuntu_16.04_amd64.deb " && sudo dpkg -i /tmp/sk1.deb

# Install yEd
  echo -e "\e[31m Install yEd \\n \e[0m"
  curl --progress-bar -L -o/tmp/yed.sh "https://www.yworks.com/resources/yed/demo/yEd-3.18.2_with-JRE10_64-bit_setup.sh" && bash /tmp/yed.sh

# Install KeepassXC
  sudo add-apt-repository -y ppa:phoerious/keepassxc && sudo apt -y install keepassxc

# Install Firefox Add-ons
  firefox https://addons.mozilla.org/firefox/downloads/file/1754702/keepassxc_browser-1.4.3-fx.xpi?src=dp-btn-primary

# Install Android-studio
  echo -e "\e[31m Install Andrion-studio \\n \e[0m"
  sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
  curl --progress-bar -L -o/tmp/android-studio.zip https://dl.google.com/dl/android/studio/ide-zips/3.2.0.26/android-studio-ide-181.5014246-linux.zip
  sudo unzip /tmp/android-studio.zip -d /opt/

# Tweaks
  echo -e "\e[31m install Tweaks \\n \e[0m"
  sudo apt-get -y install compizconfig-settings-manager

# Teamviewer
  echo -e "\e[31m Install Teamviewer \\n \e[0m"
  sudo apt install qtdeclarative5-controls-plugin qml-module-qtquick-controls qml-module-qtquick-dialogs qtdeclarative5-dialogs-plugin
  curl --progress-bar -L -o/tmp/teamviewer_amd64.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo dpkg -i /tmp/teamviewer_amd64.deb

# vSphere Client
#  echo -e "\e[31m vSphere Client \\n \e[0m"
#  curl --progress-bar -L -o/home/$USER/.cache/winetricks/msxml3/msxml3.msi "https://files.downloadnow.com/s/software/10/73/16/12/msxml3.msi?token=1539025396_6ee0a7f508da5666cc2c7781551c8e4e&fileName=msxml3.msi"
#  WINEPREFIX="/home/$USER/wine32" WINEARCH=win32 winetricks vcrun2005 vcrun2008 vcrun2010 vjrun20
#  curl --progress-bar -L -o/tmp/dotnetfx35.exe "http://download.microsoft.com/download/6/0/f/60fc5854-3cb8-4892-b6db-bd4f42510f28/dotnetfx35.exe"
#  WINEPREFIX="/home/$USER/wine32" WINEARCH=win32 wine /tmp/dotnetfx35.exe
#  curl --progress-bar -L -o/tmp/VMware-viclient-all-5.1.0-786111.exe "http://vsphereclient.vmware.com/vsphereclient/7/8/6/1/1/1/VMware-viclient-all-5.1.0-786111.exe"


# Install indicators
## System sensors
  echo -e "\e[31m Install Sensors indicator \\n \e[0m"
  sudo add-apt-repository ppa:jfi/ppa
  sudo apt-get update
  sudo apt-get -y install psensor
## Weather
  echo -e "\e[31m Install Weather indicator \\n \e[0m"
  sudo add-apt-repository ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get -y install my-weather-indicator
## Yandex disk
  echo -e "\e[31m Install Yandex Disk \\n \e[0m"
  curl --progress-bar -L -o/tmp/yandex-disk_latest_amd64.deb http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb && sudo dpkg -i yandex-disk_latest_amd64.deb
  yandex-disk setup
  sudo add-apt-repository ppa:slytomcat/ppa
  sudo apt-get update
  sudo apt-get -y install yd-tools
## Ansible settings
  echo 'export ANSIBLE_HOST_KEY_CHECKING=False' >> ~/.bashrc
}


if [ `cat /etc/issue.net | cut -d' ' -f1` == 'Ubuntu' ]; then
  Uinstall
fi
