#!/bin/bash

source Config.sh

mkdir build
cp data/datapack build/datapack

for file in build/datapack/LuckyWorld/data/minecraft/loot_tables/*
do
  echo "Processing $file"
  sed -i 's/old-text/new-text/g' $file
done

for material in equip_materials
do
  echo "Processing ${!material}"
  cp "build/datapack/LuckyWorld/data/lucky_loot/loot_tables/{material}_equip.json" "build/datapack/LuckyWorld/data/lucky_loot/loot_tables/${!material}_equip.json"
  file="build/datapack/LuckyWorld/data/lucky_loot/loot_tables/${!material}_equip.json"
  sed -i "s/{tool_material}/${!material[1]}/g" $file
  sed -i "s/{armor_material}/${!material[2]}/g" $file
  sed -i "s/{level}/${!material[3]}/g" $file
  sed -i "s/{chance}/${!material[4]}/g" $file
done

zip LuckyWorld.zip /build/datapack/
