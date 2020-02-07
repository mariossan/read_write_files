#!/bin/bash

folderToRead="$PWD/files_to_read/"
yourfilenames=`ls $folderToRead`

# ENVIRONMENT TO MONGO
DB="pepsibot"
COLLECTION="codes"
AUTHETICATION="admin"
USER="root"
PASS="rootpassword"

# COMMANDS TO import into mongo
COMMANDS_MONGO="files_to_write/commands_to_insert_mongo"
n=0

replace="_" #character to replace .

# Delete all files inside files_to_write
rm -rf files_to_write
mkdir files_to_write

# CREATE file to insert data for mongodb
touch $COMMANDS_MONGO

for originalFile in $yourfilenames
do
    echo "creando archivo $originalFile"
    finalNameFile="${originalFile//./$replace}.json"
    fileToWrite="$PWD/files_to_write/$finalNameFile"
    touch $fileToWrite;

    # Cicle to push data with the correct format to mongoDB
    while read line; 
    do
        echo "{ \"code\": \"$line\", \"status\": false, \"created_at\": false }" >> $fileToWrite
    done < "$PWD/files_to_read/$originalFile"

    # Push command to instert data created
    echo "mongoimport --db=$DB --collection=$COLLECTION --authenticationDatabase=$AUTHETICATION --username=$USER --password=$PASS --file=$finalNameFile" >> $COMMANDS_MONGO

    n=$((n+1))

    sleep 4
    
    echo "Millon $n creado\n"
done
