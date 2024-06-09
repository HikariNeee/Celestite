#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"



sudo setsebool -P domain_kernel_load_modules on
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos-lts 
rpm-ostree install kernel-cachyos-lts-devel-matched
