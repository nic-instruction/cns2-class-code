#!/bin/bash

if [ -z $3 ]
then
        echo "Usage: backup_files_by_extension.sh [file extension] [target directory] [backup directory] 
        Example: backup_files_by_extension.sh .text /home/arnold /backup 
        this is backs up files from a certain directory to anohter"
        
exit 0;
fi

fileExtention="$1"
targetDir="$2"
destinationDir="$3"

echo "file extention is: $fileExtention"
echo "target dir is: $targetDir"
echo "backup directory is: $destinationDir"

if [ ! -d "$targetDir" ]

then
        echo "$targetDir" 
        exit 0;
fi

find $targetDir -name "*$fileExtention" -exec cp {} $destinationDir \; 
