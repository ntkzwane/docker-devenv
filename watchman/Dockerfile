FROM bitnami/minideb

WORKDIR /tmp

# Install Watchman
ARG WATCHMAN_VERSION

RUN install_packages libssl-dev pkg-config libtool curl ca-certificates build-essential autoconf python-dev libpython-dev autotools-dev automake && \
    curl -LO https://github.com/facebook/watchman/archive/v${WATCHMAN_VERSION}.tar.gz && \
    tar xzf v${WATCHMAN_VERSION}.tar.gz && rm v${WATCHMAN_VERSION}.tar.gz && \
    cd watchman-${WATCHMAN_VERSION} && ./autogen.sh && ./configure && make && make install && \
    apt-get purge -y pkg-config curl ca-certificates build-essential autoconf python-dev libpython-dev autotools-dev automake libtool && \
    cd /tmp && rm -rf watchman-${WATCHMAN_VERSION}

RUN mkdir /watch

WORKDIR /watch

VOLUME /watch

# ENTRYPOINT ["watchman" ,"--foreground" ,"--logfile=/watch/user-state/log" ,"--log-level=1" ,"--sockname=/watch/user-state/sock" ,"--statefile=/watch/user-state/state" ,"--pidfile=/watch/user-state/pid"]
# ENTRYPOINT ["watchman" ,"--foreground"]
ENTRYPOINT ["tail", "-f", "/dev/null"]

RUN useradd -ms /bin/bash -u 1000 ntokozo

USER ntokozo

