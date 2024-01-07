#!/bin/bash

src_dir="/D/Scripts/HashCreater/hashDoc"

if [ ! -d ${src_dir} ]
then
echo "folder not found"
exit 1
fi

outputFile="AllDocWithHashes.txt"

for file in "${src_dir}"/*
do
if [ -f ${file} ]
then
filename=$(basename ${file})
hashKey=$(sha256sum ${file} | cut -c 1-10)
dateToday=$(date)
echo "$filename | $dateToday | $hashKey" >> "$outputFile" 
fi

done