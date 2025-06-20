FROM ubuntu:20.04


# Install Wine and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
    apt update && apt install -y \
    wine64 xvfb winbind curl unzip \
    lib32gcc-s1 lib32stdc++6 software-properties-common

LABEL org.opencontainers.image.source=https://github.com/datag8r/pelican-eggs

RUN cd \/tmp
RUN mkdir -p \/mnt\/server\/steamcmd
RUN curl -sSL -o steamcmd.tar.gz https:\/\/steamcdn-a.akamaihd.net\/client\/installer\/steamcmd_linux.tar.gz
RUN tar -xzvf steamcmd.tar.gz -C \/mnt\/server\/steamcmd
RUN mkdir -p \/mnt\/server\/steamapps 
RUN \/mnt\/server\/steamcmd\/steamcmd.sh +force_install_dir \/mnt\/server\/scum +login anonymous +app_update 3792580 validate +quit

COPY ./startup.sh /mnt/server/startup.sh
RUN chmod +x /mnt/server/startup.sh

WORKDIR /mnt/server

CMD ["bash", "startup.sh"]

