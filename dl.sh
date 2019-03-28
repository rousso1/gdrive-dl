#!/bin/bash

fileid="$1"
filename="$2"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm "cookie"
bold=$(tput bold)
if [[ ! -f "$2" ]]; then
    echo "${bold}Downloading $2 failed :("
else
    echo "${bold}Finished downloading $2"
fi

rm "dl.sh"
