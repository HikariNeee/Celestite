#!/bin/bash

set -ouex pipefail

rpm-ostree install btop lshw xdotool wmctrl

echo "Hidden=true" >> /usr/share/applications/fish.desktop
echo "Hidden=true" >> /usr/share/applications/htop.desktop
echo "Hidden=true" >> /usr/share/applications/nvtop.desktop
