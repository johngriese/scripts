#!/bin/bash
#
# Simple journaling script. Records journals in dated markdown files
# and timestamps each entry.

if [ $# -ne 1 ]; then
    echo $0: usage: logbook /path/to/file
    exit 1
fi

# define journal location here
DIR=$1

# gets date and time stamps
MONTH=$(date +%Y-%m)
TIMESTAMP=$(date +%I:%M\ %P)
DATESTAMP=$(date +%A\ %b\ %d) 

# shorthand for monthly file
FILE=$DIR/$MONTH'.md'

# checks for the existance
if ! [ -e $DIR/*$MONTH.md ]
then
        touch $FILE
fi

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
#!/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: myscript name
    exit 1
fi

