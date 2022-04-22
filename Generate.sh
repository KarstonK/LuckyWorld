#!/bin/bash

source Config.sh

rm -R build
mkdir build
cp -r data/datapack build/datapack

itemEntry=\
$'
        {
          "type": "minecraft:item",
          "weight": {weight},
          "quality": {quality},
          "name": "minecraft:diamond",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": {count}
            }
          ]
        },'
lootTableEntry=\
$'
        {
          "type": "minecraft:item",
          "weight": {weight},
          "quality": {quality},
          "name": "minecraft:diamond",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": {count}
            }
          ]
        },'
entryBuffer=""
for block in ${blocks}
do
  echo "Processing ${block}"
  cp build/datapack/LuckyWorld/data/minecraft/loot_tables/{block}.json "build/datapack/LuckyWorld/data/minecraft/loot_tables/${block}.json"
  file="build/datapack/LuckyWorld/data/minecraft/loot_tables/${block}.json"
  block=${block}[@]
  block=(${!block})
  toAdd=""
  echo 312: ${#block[@]}
  for (( i=0; i<$(( ${#block[@]} / 3 )); ++i)) # repeat for each block drop
  do
    echo 123: $i + ${block[(( $i * 3 ))]}
    weight=${block[(( $i * 3 - 2 ))]}_weight[@]
    quality=${block[(( $i * 3 - 2 ))]}_quality[@]
    count=${block[(( $i * 3 - 2 ))]}_count[@]
    for (( n=0; n<${#weight[@]}; ++n))
    do
      if [ ${block[(( $i * 3 - 3 ))]} == 0 ]
      then
        entryBuffer+=$(sed "s/{weight}/${!type}/g" ${itemEntry})
        entryBuffer+=$(sed "s/{quality}/${!type}/g" ${entryBuffer})
        toAdd+=$(sed "s/{count}/${!type}/g" ${entryBuffer})
      elif [ ${block[(( $i * 3 - 3 ))]} -eq 1 ]
      then
        entryBuffer+=$(sed "s/{weight}/${!type}/g" ${lootTableEntry})
        entryBuffer+=$(sed "s/{quality}/${!type}/g" ${entryBuffer})
        toAdd+=$(sed "s/{count}/${!type}/g" ${entryBuffer})
      else
        echo something broke
      fi
    done
  done
  sed -i "s/{entries}/${toAdd::-1}/g" $file
done
rm build/datapack/LuckyWorld/data/minecraft/loot_tables/{block}.json

for material in ${equip_materials[@]}
do
  echo "Processing ${material}"
  cp build/datapack/LuckyWorld/data/lucky_equip/loot_tables/{material}_equip.json "build/datapack/LuckyWorld/data/lucky_equip/loot_tables/${material}.json"
  file="build/datapack/LuckyWorld/data/lucky_equip/loot_tables/${material}.json"
  material=${material}[@]
  material=(${!material})
  sed -i "s/{tool_material}/${material[1]}/g" $file
  sed -i "s/{armor_material}/${material[2]}/g" $file
  sed -i "s/{level}/${material[3]}/g" $file
  sed -i "s/{chance}/${material[4]}/g" $file
done
rm build/datapack/LuckyWorld/data/lucky_equip/loot_tables/{material}_equip.json

zip LuckyWorld.zip build/datapack/
