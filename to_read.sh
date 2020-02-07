#!/bin/bash

# For para la lectura de archivos
for i in {1..2}
do
    filename="files_to_read/0$i.txt"
    n=1

    echo "Lectura del archivo $i\n";

    # new file creation
    fileToWrite="files_to_write/0$i.json"
    touch $fileToWrite;
    
    while read line; 
    do
        # reading each line
        echo "{ \"code\": \"$line\", \"status\": false, \"created_at\": false }" >> $fileToWrite
        n=$((n+1))
    done < $filename

done