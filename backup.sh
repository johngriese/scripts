#!/bin/bash
BACKUPHOST="gemini"
BACKUPDIR="/var/run/media/rad/6535a580-ae33-46bf-a4e6-75a70cb8fbdb"
EXCLUDEFILE="/home/rad/.backup-exclude.txt"

case "$HOSTNAME" in
    gemini)
        rsync_tmbackup.sh /home/rad "$BACKUPDIR/$HOSTNAME" "$EXCLUDEFILE"
        ;;
    capricorn)
        ping -q -c3 gemini > /dev/null
        if ! [ $? -eq 0 ]
        then
           echo "cannot reach $BACKUPHOST; aborting" 
           exit 1
        fi
        rsync_tmbackup.sh /home/rad "rad@$BACKUPHOST:$BACKUPDIR/$HOSTNAME" "$EXCLUDEFILE" 
        ;;
    *)
        echo "not running from a known host; aborting"
        exit 1
esac
