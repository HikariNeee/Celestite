#!/usr/bin/bash

set -ouex pipefail

# Remove nvidia specific files
if [[ "${IMAGE_FLAVOR}" =~ "nvidia" ]]; then
  :
else
  rm /usr/lib/dracut/dracut.conf.d/95-nvidia.conf
  rm /usr/lib/modprobe.d/nvidia.conf
fi

KERNEL_SUFFIX=""
QUALIFIED_KERNEL="$(rpm -qa | grep -P 'kernel-(|'"$KERNEL_SUFFIX"'-)(\d+\.\d+\.\d+)' | sed -E 's/kernel-(|'"$KERNEL_SUFFIX"'-)//')"
/usr/libexec/rpm-ostree/wrapped/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible -v --add ostree -f "/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
chmod 0600 /lib/modules/$QUALIFIED_KERNEL/initramfs.img
