#!/bin/bash

name=$1

user=$(whoami)

rand=$RANDOM

for i in {1..10}
do
    echo "Skibidi $i $name $user $RANDOM"
done