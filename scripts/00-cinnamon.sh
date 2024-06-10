#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"
echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo


# installing cinnamon
rpm-ostree install NetworkManager-bluetooth NetworkManager-iodine-gnome \
NetworkManager-l2tp-gnome NetworkManager-libreswan-gnome \
NetworkManager-openconnect-gnome NetworkManager-wifi network-manager-applet \
NetworkManager-wwan NetworkManager blueman \
cinnamon cinnamon-control-center lightdm cinnamon-screensaver eom \
ffmpegthumbnailer firewall-config gnome-screenshot gnome-terminal \
gnome-disk-utility gvfs-archive gvfs-gphoto2 gvfs-mtp gvfs-smb \
imsettings-gsettings initial-setup-gui metacity nemo-image-converter \
nemo-preview nemo-python nm-connection-editor paper-icon-theme nemo \
pipewire pipewire-alsa pipewire-pulseaudio touchegg redshift-gtk \
slick-greeter slick-greeter-cinnamon xdg-user-dirs-gtk xed xfburn xreader \
flatpak python3-pip appstream-compose at-spi2-atk at-spi2-core system76-scheduler \
fastfetch power-profiles-daemon gnome-software glow 


rpm-ostree override replace --experimental --freeze --from repo='copr:copr.fedorainfracloud.org:sentry:kernel-fsync' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra
