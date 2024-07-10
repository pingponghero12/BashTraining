#!/bin/bash

if [ ! -f log.txt ]; then
	echo "No log file in currnet directory"
	exit 1
fi

lf='log.txt'

declare -A ip_count

cat "$lf"
echo ""

while read lines; do
	ip=$(echo "$lines" | cut -d ' ' -f1)
	echo "$ip"
	
	if [[ -n "${ip_count["$ip"]}" ]]; then
		ip_count["$ip"]=$((ip_count["$ip"] + 1))
	else
		ip_count["$ip"]=1
	fi

done < "$lf"
	
for ip in "${!ip_count[@]}"; do
	echo "$ip: ${ip_count[$ip]}"
done
