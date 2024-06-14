#!/bin/bash

set -ouex pipefail
systemctl enable lightdm.service
systemctl enable ublue-lightdm-workaround.service
systemctl enable touchegg.service
systemctl enable com.system76.Scheduler.service
systemctl enable brew-setup.service brew-update.service brew-upgrade.service
systemctl enable brew-update.timer brew-upgrade.timer
