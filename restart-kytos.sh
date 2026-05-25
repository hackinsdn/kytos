#!/bin/bash

KYTOSCMD=$(pgrep -af kytosd | head -n1 | cut -d" " -f2-)

if [ -z "$KYTOSCMD" ]; then
	KYTOSCMD='tmux new-session -d -s kytosserver "kytosd -f --database mongodb"'
fi

echo Stopping Kytos...
pkill kytosd
sleep 3
pkill -9 kytosd
echo Starting Kytos..
sleep 2
exec $KYTOSCMD
