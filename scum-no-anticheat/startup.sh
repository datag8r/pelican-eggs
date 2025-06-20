#!/bin/bash
cd /home/container

if [ "${UPDATE_ON_BOOT}" == "1" ]; then
    echo "Updating SCUM server via SteamCMD..."
    /steamcmd/steamcmd.sh +login anonymous \
        +force_install_dir /home/container/scum_server \
        +login anonymous \
        +app_update 3792580 validate +quit
fi

# Start the server
cd /home/container/scum_server
xvfb-run --auto-servernum wine SCUMServer.exe -log -PORT=${SERVER_PORT:-7777}
