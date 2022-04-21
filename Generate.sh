#!/bin/bash

source config.sh

mkdir build
cp data/datapack build/datapack

for file in build/datapack/LuckyWorld/data/minecraft/loot_tables/*
do
	echo "Processing $file"
  sed -i 's/old-text/new-text/g' $file
done
