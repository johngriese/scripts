#!/bin/bash
#
# Simple journaling script. Records journals in dated markdown files
# and timestamps each entry.

# define journal location here
DIR=$HOME/documents/journal

# gets date and time stamps
MONTH=$(date +%Y-%m)
TIMESTAMP=$(date +%I:%M\ %P)
DATESTAMP=$(date +%A\ %b\ %d) 

# shorthand for monthly file
FILE=$DIR/$MONTH'.md'


# checks to see if datestamp exists yet
if grep -Fxq '## '"$DATESTAMP" $FILE
    then
        echo "" >> $FILE
        echo '*'$TIMESTAMP':*  ' >> $FILE
    else
        echo "" >> $FILE
        echo '## '$DATESTAMP >> $FILE
        echo "" >> $FILE
        echo '*'$TIMESTAMP':*  ' >> $FILE
fi

# opens today's journal appending to last line
vim '+ normal G$' +star $FILE
