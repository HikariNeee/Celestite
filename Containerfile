ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG} as rolls

COPY rootfs/ /
COPY build_files/initramfs.sh /tmp/initramfs.sh
COPY scripts/00-cinnamon.sh /tmp/00-cinnamon.sh
COPY scripts/01-delete-packages.sh /tmp/01-delete-packages.sh
COPY scripts/02-mesa.sh /tmp/02-mesa.sh

# test schemas
RUN mkdir -p /tmp/test && \
    cp /usr/share/glib-2.0/schemas/zz0-rolls.gschema.override /tmp/test/ && \
    echo "Running error test for bluefin gschema override. Aborting if failed." && \ 
    glib-compile-schemas --strict /tmp/test && \
    echo "Compiling gschema to include bluefin setting overrides" && \
    glib-compile-schemas /usr/share/glib-2.0/schemas &>/dev/null
 
RUN rpm-ostree cliwrap install-to-root / && \
    mkdir -p /var/lib/alternatives && \
    curl -Lo /etc/yum.repos.d/copr_fsync.repo  https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/repo/fedora-${SOURCE_TAG}/sentry-kernel-fsync-fedora-${SOURCE_TAG}.repo && \ 
    curl -Lo /etc/yum.repos.d/copr_sys76.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-${SOURCE_TAG}/kylegospo-system76-scheduler-fedora-${SOURCE_TAG}.repo  && \
    /tmp/00-cinnamon.sh &&  \
    /tmp/01-delete-packages.sh && \
    /tmp/02-mesa.sh && \
    pip install --prefix=/usr yafti && \
    rm -rf /tmp/* /var/* && \
    systemctl enable lightdm.service && \
    systemctl enable ublue-lightdm-workaround.service && \ 
    systemctl enable touchegg.service && \ 
    systemctl enable com.system76.Scheduler.service && \   
    mkdir -p /usr/etc/flatpak/remotes.d && \
    curl -Lo /usr/etc/flatpak/remotes.d/flathub.flatpakrepo https://dl.flathub.org/repo/flathub.flatpakrepo && \
    fc-cache -fv && \
    sed -i '/^PRETTY_NAME/s/.*/Rolls Kyoto/' /usr/lib/os-release && \
    /tmp/initramfs.sh && \
    ostree container commit && \
    mkdir -p /var/tmp && \
    chmod -R 1777 /var/tmp

