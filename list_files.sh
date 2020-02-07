#!/bin/bash

yourfilenames=`ls files_to_read/`
replace="_" #character to replace .
for originalFile in $yourfilenames
do
   echo "original file:\\t $originalFile"
   finalFile="${originalFile//./$replace}.json"
   echo "final file:\\t $finalFile"
done
#echo ${var//./$replace}