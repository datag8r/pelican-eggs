#!/bin/bash
if [ "${UPDATE_ON_BOOT}" == "1" ]; then
    echo "Updating SCUM server via SteamCMD..."
    /mnt/server/steamcmd/steamcmd.sh +login anonymous \
        +force_install_dir /mnt/server \
        +login anonymous \
        +app_update 3792581 validate +quit
fi

# Start the server
echo "Starting SCUM server with Wine..."
xvfb-run --auto-servernum wine /mnt/server/SCUMServer.exe -log -PORT=${SERVER_PORT:-7777} -nobattleye
