#!/bin/bash
# Path to rootfs of Ubuntu from Windows C:\Users\%USERNAME%\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\

  sudo dbus-uuidgen > /var/lib/dbus/machine-id

  echo 'export DISPLAY=:0' >> ~/.bashrc
  echo 'export ANSIBLE_HOST_KEY_CHECKING=False' >> ~/.bashrc

# Install Tools
  echo -e "\e[31minstall Tools \\n \e[0m"
  sudo apt-get -y install \
  whois mc traceroute nmap fping iperf iperf3 zenmap \
  sshpass curl snmp xca \
  gitg gitk subversion sqlite3 dosbox \
  python-setuptools python-dev freetds-dev python-redis \
  mysql-workbench \
  filezilla speedtest-cli

# Install Ansible
  echo -e "\e[31m Install ansible \\n \e[0m"
  sudo add-apt-repository -y ppa:ansible/ansible && sudo apt update && sudo apt -y install ansible

# Install kubectl
# Origin: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
  sudo apt-get update && sudo apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  sudo apt-get update
  sudo apt-get install -y kubectl

# Install Asbru (new version of pac manager)
  echo -e "\e[31m install Asbru (Pac) \\n \e[0m"
  if [ "XDG_CURRENT_DESKTOP" == "Unity" ]; then sudo apt -y install libgtk2-appindicator-perl; fi
#  if [ "XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]; then sudo apt -y install libgtk2-appindicator-perl; fi
  sudo apt -y install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl dbus-x11
  curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
  sudo apt-get -y install asbru-cm

  echo -e "\e[31m Install Keepass\\n \e[0m"
# Install KeepassXC
  sudo add-apt-repository -y ppa:phoerious/keepassxc && sudo apt -y install keepassxc

# Install Firefox Add-ons
  firefox https://addons.mozilla.org/firefox/downloads/file/1754702/keepassxc_browser-1.4.3-fx.xpi?src=dp-btn-primary
