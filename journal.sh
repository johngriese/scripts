#!/bin/bash
#
# Simple journaling script. Records journals in dated markdown files
# and timestamps each entry.

# define journal location here
JOURNAL=$HOME/documents/journal

# gets date and time stamps
DATE=$(date +%F)
MONTH=$(date +%Y-%m)
TIMESTAMP=$(date +%F\ %I:%M\ %P)

# writes timestamp to today's journal
echo "" >> $JOURNAL/$MONTH'.md'
echo '### '$TIMESTAMP':' >> $JOURNAL/$MONTH'.md'
echo "" >> $JOURNAL/$MONTH'.md'

# opens today's journal
vim '+ normal Go' +star $JOURNAL/$MONTH'.md'
