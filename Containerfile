ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY rootfs/ /
COPY scripts/00-cinnamon.sh /tmp/00-cinnamon.sh
COPY scripts/01-delete-packages.sh /tmp/01-delete-packages.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/00-cinnamon.sh && \
    /tmp/01-delete-packages.sh && \
    systemctl enable lightdm.service && \
    systemctl enable ublue-lightdm-workaround && \ 
    systemctl enable flatpak-add-flathub-repo.service && \
    systemctl enable flatpak-replace-fedora-apps.service && \
    systemctl enable flatpak-add-firefox.service && \
    systemctl enable flatpak-cleanup.timer && \
    systemctl enable touchegg.service && \ 
    systemctl enable set-theme.service && \	
    ostree container commit && \
    mkdir -p /var/tmp && \
    chmod -R 1777 /var/tmp
