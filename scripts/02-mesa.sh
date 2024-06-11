#!/bin/bash

set -ouex pipefail
echo "
[copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib]
name=Copr repo for bazzite-multilib owned by kylegospo
baseurl=https://download.copr.fedorainfracloud.org/results/kylegospo/bazzite-multilib/fedora-\$releasever-\$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://download.copr.fedorainfracloud.org/results/kylegospo/bazzite-multilib/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1

[copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib:ml]
name=Copr repo for bazzite-multilib owned by kylegospo (i386)
baseurl=https://download.copr.fedorainfracloud.org/results/kylegospo/bazzite-multilib/fedora-\$releasever-i386/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://download.copr.fedorainfracloud.org/results/kylegospo/bazzite-multilib/pubkey.gpg
repo_gpgcheck=0
cost=1100
enabled=1
enabled_metadata=1
" > /etc/yum.repos.d/copr_bazzite_multilib.repo


rpm-ostree override remove mesa-va-drivers-freeworld
rpm-ostree override replace \
 --experimental \
 --from repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib \
        mesa-filesystem \
        mesa-libxatracker \
        mesa-libglapi \
        mesa-dri-drivers && \
        mesa-libgbm \
        mesa-libEGL \
        mesa-vulkan-drivers \
        mesa-libGL \
        pipewire \
        pipewire-alsa \
        pipewire-gstreamer \
        pipewire-jack-audio-connection-kit \
        pipewire-jack-audio-connection-kit-libs \
        pipewire-libs \
        pipewire-pulseaudio \
        pipewire-utils \
        bluez \
        bluez-obexd \
        bluez-cups \
        bluez-libs

rpm-ostree install \
        mesa-va-drivers-freeworld \
        mesa-vdpau-drivers-freeworld.x86_64 \
        libaacs \
        libbdplus \
        libbluray
