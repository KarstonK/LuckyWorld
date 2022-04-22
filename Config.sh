#!/bin/bash

equip_materials=(wood_equip stone_equip deepslate_equip obsidian_equip iron_equip copper_equip gold_equip diamond_equip)
# format: {file name}=({tool type} {tool custom model} {armor type} {armor custom model} {enchant level} {enchant chance})
wood_equip=(wooden 0 leather wood 2 0.1)
stone_equip=(stone 0 chain stone 3 0.2)
deepslate_equip=(stone deepslate chain deepslate 4 0.2)
obsidian_equip=(stone obsidian chain obsidian 5 0.2)
iron_equip=(iron 0 iron 4 0.3)
copper_equip=(iron copper iron copper 3 0.3)
gold_equip=(gold 0 gold 0 4 0.4)
diamond_equip=(diamond 0 diamond 0 5 0.5)

custom_items=(kb_stick)
# format: {item name}=({item} {custom model} {custom name} {enchantments})
# example=(bow minecraft:blocks/dirt 'Example item' 'minecraft:sharpness:10 minecraft:infinity:1 minecraft:power:10')
kb_stick=(stick 0 'Knockback Stick' minecraft:knockback:10)

lots_weight=( 48 12 3  1)
lots_quality=(-8 5  2  1)
lots_count=(  1  4  16 64)
extra_weight=64
extra_quality=16
extra_count=1

blocks=(oak_log spruce_log birth_log jungle_log acacia_log dark_oak_log crimson_stem warped_stem stone deepslate obsidian iron_ore copper_ore gold_ore \
        diamond_ore)
# format: {name}=({type(0,1)}{weight(lots,extra)}{item})
# example=(0 lots dirt 1 extra minecraft:burried_treasure)
oak_log=(0 lots oak_log 1 extra lucky_equip:iron_equip)
spruce_log=(0 lots spruce_log 1 extra lucky_equip:iron_equip)
birth_log=(0 lots birth_log 1 extra lucky_equip:iron_equip)
jungle_log=(0 lots jungle_log 1 extra lucky_equip:iron_equip)
acacia_log=(0 lots acacia_log 1 extra lucky_equip:iron_equip)
dark_oak_log=(0 lots dark_oak_log 1 extra lucky_equip:iron_equip)
crimson_stem=(0 lots crimson_stem 1 extra lucky_equip:iron_equip)
warped_stem=(0 lots warped_stem 1 extra lucky_equip:iron_equip)
stone=(0 lots cobblestone 1 extra lucky_equip:iron_equip)
deepslate=(0 lots cobbled_deepslate 1 extra lucky_equip:iron_equip)
obsidian=(0 lots obsidian 1 extra lucky_equip:iron_equip)
iron_ore=(0 lots iron_ingot 1 extra lucky_equip:iron_equip)
copper_ore=(0 lots copper_ingot 1 extra lucky_equip:soft_iron_equip)
gold_ore=(0 lots gold_ingot 1 extra lucky_equip:gold_equip)
diamond_ore=(0 lots diamond 1 extra lucky_equip:diamond_equip)
