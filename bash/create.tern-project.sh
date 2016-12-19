#!/bin/bash
file=".tern-project"
echo "{" > $file
echo '"libs": [' >> $file
echo '"browser",' >> $file
echo '"jquery"' >> $file
echo '],' >> $file
echo '"loadEagerly": [ ' >> $file

function scanfolder() {
for f in $1/*
do
    if [ -d $f ]; then
        if [ $(basename $f) != "tmp" ]; then
            scanfolder $f
        fi
    else
        echo $f
        filename=`basename $f`
        ext=${filename##*.}
        if [ $ext = "js" ]; then
            echo '"'$f'"', >> $file 
        fi
    fi
done
}
scanfolder `pwd`

echo '],' >> $file
echo '"plugins": {' >> $file
echo '"requirejs": {' >> $file
echo '"baseURL": "./",' >> $file
echo '"paths": {}' >> $file
echo '}' >> $file
echo '}' >> $file
echo '}' >> $file
