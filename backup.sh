#!/bin/bash

##### bkp.sh #####
# A tiny backup script using rdiff-backup.

# Set target and backup locations
TARGET=$HOME
BACKUP="pi::/mnt/raid1/backup"

# runs backup
rdiff-backup \
        -v4 \
        --exclude $HOME'/.*' \
        --exclude $HOME/temp \
        --exclude $HOME/downloads \
        $TARGET \
        $BACKUP
