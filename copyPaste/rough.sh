#!/bin/bash



src_f="/D/Scripts/copyPaste/src"
des_f="/D/Scripts/copyPaste/des"


for file in "${src_f}"/*
do
fileCop=$(basename "${file}")
if [ ! -f "${des_f}/${fileCop}" ]
then
cp ${file} ${des_f}
fi

done

sleep 10