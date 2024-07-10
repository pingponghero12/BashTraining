#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <directory>"
	exit 1
fi

files=(`ls $1`)

echo "$files"
echo "$0" 

for i in ${files[@]}; do
	ext="${i##*.}"
	
	if test -d "$1/$ext"; then
		mv "$1/$i" "$1/$ext/"
	else
		mkdir "$1/$ext"
		mv "$1/$i" "$1/$ext/"
	fi
done
