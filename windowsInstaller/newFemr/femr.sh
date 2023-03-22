#!/bin/sh

#if [ -x "$(command -v docker)" ]; then
#    echo "Docker Installed"
#else
#    echo "Installing docker"
#    ./dockerInstall.exe install --accept-license
#
#fi

start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Docker Desktop" %1

sleep 5
docker-compose up

sleep 5
done