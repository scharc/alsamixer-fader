#!/bin/bash
VOLUMECHANNEL="Digital"
VOLUMEALSA=$(amixer -M get $VOLUMECHANNEL | grep -m 1 -o "...%" |head -1)
VOLUMEALSA=${VOLUMEALSA//[^[:digit:].]/}
FADETO=$1
SPEED=$2
VOLUMESTEP=1
FADEVOLUME=$VOLUMEALSA
if [[ $VOLUMEALSA -gt $FADETO ]]; then
    # Fading Out
    until [[ $FADEVOLUME -le $FADETO || $FADEVOLUME -le 0 ]]; do
        FADEVOLUME=$(($FADEVOLUME-$VOLUMESTEP))
        amixer -q -M set "$VOLUMECHANNEL" "${FADEVOLUME}%"
        sleep $SPEED
    done
else 
    # Fading in
    until [[ $FADEVOLUME -ge $FADETO || $FADEVOLUME -ge 100 ]]; do
        FADEVOLUME=$(($FADEVOLUME+$VOLUMESTEP))
        amixer -q -M set "$VOLUMECHANNEL" "${FADEVOLUME}%"
        sleep $SPEED
    done
fi
