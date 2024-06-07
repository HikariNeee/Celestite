#!/bin/bash

if [ ! -d /var/cache/lightdm ]; then echo "creating /var/cache/lightdm";mkdir /var/cache/lightdm; fi

if [ ! -d /var/log/lightdm ]; then echo "creating /var/log/lightdm";mkdir /var/log/lightdm; fi
if [ ! -d /var/lib/lightdm ]; then echo "creating /var/lib/lightdm";mkdir /var/lib/lightdm; fi
if [ ! -d /var/lib/lightdm-data ]; then echo "creating /var/lib/lightdm-data";mkdir /var/lib/lightdm-data; fi

getent group lightdm >/dev/null || groupadd -r lightdm
echo "created lightdm group"
getent passwd lightdm >/dev/null || useradd -g lightdm -M -d /var/lib/lightdm -s /sbin/nologin -r lightdm
echo "added lightdm user"
systemctl set-default graphical.target
echo "background=/usr/share/backgrounds/default_back.png" | tee -a /etc/lightdm/slick-greeter.conf
echo "theme-name='Lavanda-Sea-Dark'" | tee -a /etc/lightdm/slick-greeter.conf
echo "font-name='Clear Sans 12'" | tee -a /etc/lightdm/slick-greeter.conf

