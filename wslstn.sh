#!/bin/bash
# Path to rootfs of Ubuntu from Windows C:\Users\%USERNAME%\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\

  sudo dbus-uuidgen > /var/lib/dbus/machine-id

# Install Tools
  echo "install Tools \033[0m"
  sudo apt-get -y install \
  whois mc traceroute nmap fping iperf iperf3 zenmap \
  sshpass curl snmp xca \
  gitg gitk sqlite3 dosbox \
  python-setuptools python-dev freetds-dev python-redis \
  openxenmanager mysql-workbench \
  filezilla speedtest-cli

# Install Ansible
  echo -en "\033[37;1;41m Install ansible \033[0m\\t$a"
  sudo add-apt-repository -y ppa:ansible/ansible && sudo apt update && sudo apt -y install ansible

# Install Asbru (new version of pac manager)
  echo -en "\033[37;1;41m install Asbru (Pac) \033[0m\\t$a"
  if [ "XDG_CURRENT_DESKTOP" == "Unity" ]; then sudo apt -y install libgtk2-appindicator-perl; fi
#  if [ "XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]; then sudo apt -y install libgtk2-appindicator-perl; fi
  sudo apt -y install gtk2-engines-pixbuf libcrypt-blowfish-perl libcrypt-cbc-perl libcrypt-rijndael-perl libexpect-perl libgnome2-gconf-perl libgtk2-ex-simple-list-perl libgtk2-gladexml-perl libgtk2-unique-perl \
  libio-stty-perl libnet-arp-perl libnet-pcap-perl libnet-proxy-perl libossp-uuid-perl libossp-uuid16 libunique-1.0-0 libyaml-perl dbus-x11
  curl -s https://packagecloud.io/install/repositories/asbru-cm/asbru-cm/script.deb.sh | sudo bash
  sudo apt-get install asbru-cm

# Install KeepassXC
  sudo add-apt-repository -y ppa:phoerious/keepassxc && sudo apt -y install keepassxc

# Install Firefox Add-ons
  firefox https://addons.mozilla.org/firefox/downloads/file/1754702/keepassxc_browser-1.4.3-fx.xpi?src=dp-btn-primary
