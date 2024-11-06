#!/bin/bash

latestGitDownload(){
    cd /tmp

    ENLACE=$(curl -s "https://api.github.com/repos/$1/releases/latest" | grep $2 | awk  'NR > 1 {gsub(/"/, "", $2); print $2}')

    wget $ENLACE
}

#latestGitDownload MichaelMure/mdr mdr_linux_amd64
