#!/bin/bash

files=(`ls $1 | grep .txt`)

index1=1

for i in "${files[@]}"; do 
	index2=0
	while read lines; do
		index2=$((1+index2))
	done < "$i"
	
	echo "$index1: $i = $index2"
	index1=$((1+index1))
done

