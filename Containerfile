ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY rootfs/ /
COPY scripts/00-cinnamon.sh /tmp/00-cinnamon.sh
COPY scripts/01-delete-packages.sh /tmp/01-delete-packages.sh

# test schemas
RUN mkdir -p /tmp/test && \
    cp /usr/share/glib-2.0/schemas/zz0-rolls.gschema.override /tmp/test/ && \
    echo "Running error test for bluefin gschema override. Aborting if failed." && \ 
    glib-compile-schemas --strict /tmp/test && \
    echo "Compiling gschema to include bluefin setting overrides" && \
    glib-compile-schemas /usr/share/glib-2.0/schemas &>/dev/null


RUN mkdir -p /var/lib/alternatives && \
    /tmp/00-cinnamon.sh && \
    /tmp/01-delete-packages.sh && \
    pip install --prefix=/usr yafti && \
    rm -rf /tmp/* /var/* && \
    systemctl enable lightdm.service && \
    systemctl enable ublue-lightdm-workaround.service && \ 
    systemctl enable flatpak-add-flathub-repo.service && \
    systemctl enable touchegg.service && \ 
    systemctl enable --global flatpak-user-flathub-repo.service && \
    fc-cache -fv && \
    ostree container commit && \
    mkdir -p /var/tmp && \
    chmod -R 1777 /var/tmp
