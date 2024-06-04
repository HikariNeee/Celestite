#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# installing cinnamon
rpm-ostree install NetworkManager-bluetooth NetworkManager-iodine-gnome \
NetworkManager-l2tp-gnome NetworkManager-libreswan-gnome \
NetworkManager-openconnect-gnome NetworkManager-wifi network-manager-applet \
NetworkManager-wwan NetworkManager abrt-desktop abrt-java-connector blueman \
cinnamon cinnamon-control-center lightdm cinnamon-screensaver eom \
ffmpegthumbnailer firewall-config gnome-screenshot gnome-terminal \
gnome-disk-utility gvfs-archive gvfs-gphoto2 gvfs-mtp gvfs-smb \
imsettings-gsettings initial-setup-gui metacity nemo-image-converter \
nemo-preview nemo-python nm-connection-editor paper-icon-theme nemo \
pipewire pipewire-alsa pipewire-pulseaudio touchegg redshift-gtk \
slick-greeter slick-greeter-cinnamon xdg-user-dirs-gtk xed xfburn xreader \
flatpak fish


