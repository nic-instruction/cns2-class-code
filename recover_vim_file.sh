#!/bin/bash


if [ -z "$1" ]
then
        echo "
        Usage: recover_vim_file.sh [fileName]
        Example: recover_vim_file.sh help.txt
        This script is used to recover a vim .swp file
        "
        exit 0;
fi

filename="$1"
finddir=$(dirname $filename)
tempfile=$(basename $filename)
tempfile="$finddir/.$tempfile.swp"
#tempfile=".$tempfile.swp"

cp $filename $filename.bak
vim -u NONE -r "$tempfile" -c 'w! '"$filename"'' -c 'wq!'
sdiff $filename $filename.bak

 exit 0;
