#!/bin/bash
mkdir "${HOME}/.config/gtk-4.0"
ln -sf /usr/share/themes/Lavanda-Sea-Light/gtk-4.0/gtk.css "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf /usr/share/themes/Lavanda-Sea-light/gtk-4.0/assets  "${HOME}/.config/gtk-4.0/assets"
ln -sf /usr/share/themes/Lavanda-Sea-Light/gtk-4.0/gtk-dark.css  "${HOME}/.config/gtk-4.0/gtk-dark.css"


echo "setting lavanda as flatpak style"
/usr/share/firstboot/stylepak  install-user Lavanda-Sea-Light
/usr/share/firstboot/stylepak install-system Lavanda-Sea-Light


