#!/bin/bash

##### bkp.sh #####
# A tiny backup script using rsync

# define local directory to backup
LOCAL=$HOME

# define remove directory to backup to
REMOTE=pi:/home/rad/backup
 
# begin rsync with the following flags
#   -a: archive mode. Recursive, preserve links, etc.
#   --verbose: tell me more!
#   --exclude the following directories:
#       ~/download
#       ~/temp
rsync   \
        -a \
        --verbose \
        --exclude $HOME/downloads \
        --exclude $HOME/temp \
        $LOCAL \
        $REMOTE
