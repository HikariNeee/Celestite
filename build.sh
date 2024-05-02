#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install emacs broadcom-wl iwd fish libva-intel-driver distrobox
rpm-ostree override remove firefox firefox-langpacks qemu-user gamemode virtualbox-guest-additions \ 
                    kwrite kwrited krfb krfb-libs kmousetool plasma-browser-integration   \
                    mariadb mariadb-server
# this would install a package from rpmfusion
# rpm-ostree install vlc

#disabling some unneeeded services
systemctl disable NetworkManager-wait-online ModemManager audit-rules lvm2-monitor cups.socket cups systemd-homed switcheroo-control auditd

