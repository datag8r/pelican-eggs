FROM ubuntu:20.04


# Install Wine and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
    apt update && apt install -y \
    wine64 xvfb winbind curl unzip \
    lib32gcc-s1 lib32stdc++6 software-properties-common

# Install SteamCMD
RUN mkdir -p /steamcmd && cd /steamcmd && \
    curl -sL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# Add startup script

LABEL org.opencontainers.image.source=https://github.com/datag8r/pelican-eggs

COPY startup.sh /home/container/startup.sh
RUN chmod +x /home/container/startup.sh

CMD ["startup.sh"]

WORKDIR /home/container