ARG BASE_IMAGE_TAG="debian-11"
ARG APP_ICON="https://raw.githubusercontent.com/oxen-io/session-desktop/clearnet/images/session/session_icon.png"

FROM jlesage/baseimage-gui:${BASE_IMAGE_TAG}
ENV APP_NAME="Session Private Messenger" \
    DARK_MODE="1" \
    LANG="en-EN.UTF-8"

RUN : \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -yq update \
    && apt-get -yq --no-install-recommends install \
        curl \
        gpg \
        libgbm1 \
        procps \
        libatk-adaptor \ 
        libcups2 \
        libgtk-3-dev \
    && curl -so /etc/apt/trusted.gpg.d/oxen.gpg https://deb.oxen.io/pub.gpg \
    && echo "deb https://deb.oxen.io bullseye main" | tee /etc/apt/sources.list.d/oxen.list \
    && apt-get -yq update \
    && apt-get -yq --no-install-recommends install session-desktop \
    && apt-get -yq purge curl gpg \
    && apt-get -yq autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN : \
    && chown root:root /opt/Session/chrome-sandbox \
    && chmod 755 /opt/Session/chrome-sandbox 

ARG APP_ICON
RUN install_app_icon.sh ${APP_ICON}

COPY ./startapp.sh /startapp.sh

VOLUME ["/config"]
