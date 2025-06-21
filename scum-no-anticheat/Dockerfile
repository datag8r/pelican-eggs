FROM ubuntu:20.04

# Install Wine and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
    apt update && apt install -y \
    wine64 xvfb winbind curl unzip \
    lib32gcc-s1 lib32stdc++6 software-properties-common
# Github Repo Label for GHCR
LABEL org.opencontainers.image.source=https://github.com/datag8r/pelican-eggs

COPY ./startup.sh /mnt/server/startup.sh
RUN chmod +x /mnt/server/startup.sh

WORKDIR /mnt/server