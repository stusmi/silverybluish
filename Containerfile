ARG FEDORA_MAJOR_VERSION=37

FROM ghcr.io/ublue-os/silverblue-main:${FEDORA_MAJOR_VERSION}

COPY etc /etc
# COPY usr /usr

COPY silverybluish-firstboot /usr/bin
COPY recipe.yml /etc/silverybluish-recipe.yml

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

RUN rpm-ostree override remove firefox firefox-langpacks

RUN echo "-- Installing RPMs defined in recipe.yml --" && \
    rpm_packages=$(yq '.rpms[]' < /etc/silverybluish-recipe.yml) && \
    for pkg in $rpm_packages; do \
        echo "Installing: ${pkg}" && \
        rpm-ostree install $pkg; \
    done && \ 
    systemctl unmask dconf-update.service && \
    systemctl enable dconf-update.service && \
    systemctl enable tailscaled.service && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    echo "---"

RUN rm -rf \
        /tmp/* \
        /var/* && \
    rm -f /etc/yum.repos.d/tailscale.repo && \
    ostree container commit
