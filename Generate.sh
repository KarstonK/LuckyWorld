#!/bin/bash

source Config.sh

rm -R build
mkdir build
cp -r data/datapack build/datapack

itemEntrySingle=\
$'
        {
          "type": "minecraft:item",
          "weight": {weight},
          "quality": {quality},
          "name": "minecraft:diamond"
        },'
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
for block in ${blocks}
do
  echo "Processing ${block}"
  cp build/datapack/LuckyWorld/data/minecraft/loot_tables/{block}.json "build/datapack/LuckyWorld/data/minecraft/loot_tables/${block}.json"
  file="build/datapack/LuckyWorld/data/minecraft/loot_tables/${block}.json"
  block=${block}[@]
  block=(${!block})
  toAdd=''
  echo 312: ${#block[@]}
  for (( i=0; i<$(( ${#block[@]} / 4 )); ++i)) # repeat for each block drop
  do
    echo 123: $i + ${block[(( $i * 4 ))]}
    weight=${block[(( $i * 4 - 2 ))]}_weight[@]
    quality=${block[(( $i * 4 - 2 ))]}_quality[@]
    count=${block[(( $i * 4 - 2 ))]}_count[@]
    for (( n=0; n<${#weight[@]}; ++n)) # repeat for each weighting of the drop
    do
      if [ ${block[(( $i * 4 - 3 ))]} == 0 ]
      then
        if [ ${!count} == 1 ]
        then
          entryBuffer=${itemEntrySingle}
        else
          entryBuffer=${itemEntry}
          entryBuffer=$(sed "s/{count}/${!count}/g" <<< ${entryBuffer})
        fi
        entryBuffer=$(sed "s/{weight}/${!weight}/g" <<< ${entryBuffer})
        if [ ${!quality} != 0 ]
        then
          entryBuffer=$(sed "s/{quality}/${!quality}/g" <<< ${entryBuffer})
        fi
        toAdd+=${entryBuffer}
      elif [ ${block[(( $i * 4 - 3 ))]} -eq 1 ]
      then
        entryBuffer+=$(sed "s/{weight}/${!type}/g" <<< ${lootTableEntry})
        entryBuffer+=$(sed "s/{quality}/${!type}/g" <<< ${entryBuffer})
        toAdd+=$(sed "s/{count}/${!type}/g" <<< ${entryBuffer})
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
  sed -i "s/{tool_material}/${material[0]}/g" $file
  sed -i "s/{armor_material}/${material[2]}/g" $file
  sed -i "s/{level}/${material[4]}/g" $file
  sed -i "s/{chance}/${material[5]}/g" $file
done
rm build/datapack/LuckyWorld/data/lucky_equip/loot_tables/{material}_equip.json

for item in ${progressive_items[@]}
do
  echo "Processing ${item}"
  cp build/datapack/LuckyWorld/data/lucky_items/loot_tables/{item}.json "build/datapack/LuckyWorld/data/lucky_items/loot_tables/${item}.json"
  file="build/datapack/LuckyWorld/data/lucky_items/loot_tables/${item}.json"
  item=${item}[@]
  item=(${!item})
  for (( i=0; i<${#block[@]}; ++i))
  do
    if [ ${!count} == 1 ]
    then
      entryBuffer=${itemEntrySingle}
    else
      entryBuffer=${itemEntry}
      entryBuffer=$(sed "s/{count}/${progressive_count[$i]}/g" <<< ${entryBuffer})
    fi
    entryBuffer=$(sed "s/{weight}/${progressive_weight[$i]}/g" <<< ${entryBuffer})
    entryBuffer=$(sed "s/{quality}/${progressive_quality[$i]}/g" <<< ${entryBuffer})
    toAdd+=${entryBuffer}
  done
  sed -i "s/{entries}/${toAdd::-1}/g" $file
done
rm build/datapack/LuckyWorld/data/lucky_items/loot_tables/{item}.json

zip LuckyWorld.zip build/datapack/
