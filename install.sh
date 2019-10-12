#!/bin/sh
clear
read -p "This script installs Zoneminder 1.32.x on Ubuntu 16.04 AMD64 with LAMP (MySQL) installed...
Press Enter to continue or Ctrl + c to quit" nothing
clear
read -p "You must be logged in as root using sudo su ...
Press Enter to continue or Ctrl + c to quit" nothing
clear
read -p "Next we will add the PPA repository, install and configure the system to run Zoneminder. You will have to press enter twice to load two PPA repositories.
Press enter to continue" nothing
apt install -y software-properties-common
clear
add-apt-repository ppa:iconnor/zoneminder
add-apt-repository ppa:iconnor/zoneminder-1.32
apt update
clear
awk '$0="date.timezone = "$0' /etc/timezone >> /etc/php/7.0/apache2/php.ini
clear
apt install -y zoneminder
systemctl enable zoneminder
service zoneminder start
adduser www-data video
a2enconf zoneminder
a2enmod rewrite
chown -R www-data:www-data /usr/share/zoneminder/
service apache2 reload
clear
read -p "Install complete.Press enter to continue" nothing
clear
