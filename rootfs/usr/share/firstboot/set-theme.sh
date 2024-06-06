#!/bin/bash

gsettings set org.cinnamon.desktop.interface gtk-theme 'Lavanda-Sea-Dark'
gsettings set org.cinnamon.theme name 'Lavanda-Sea-Dark'
gsettings set org.x.apps.portal color-scheme 'prefer-dark'
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/default_back.png'

echo "setting lavanda as flatpak style"
/usr/share/firstboot/stylepak  install-user
/usr/share/firstboot/stylepak install-system


