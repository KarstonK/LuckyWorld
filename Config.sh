#!/bin/bash

equip_materials=(wood_equip stone_equip deepslate_equip obsidian_equip iron_equip copper_equip gold_equip diamond_equip)
# format: {file name}=({tool type} {tool custom model} {armor type} {armor custom model} {enchant level} {enchant chance})
# example: dirt_equip=(wooden 0 leather dirt 5 0.1)
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
fire_stick=(blaze_rod 0 'Firey Stick' minecraft:fire_aspect:5)

extra_weight=64
extra_quality=16
extra_count=1

blocks=(oak_log spruce_log birth_log jungle_log acacia_log dark_oak_log crimson_stem warped_stem stone deepslate obsidian iron_ore copper_ore gold_ore \
        diamond_ore)
# format: {name}=({type(0,1)} {weight(lots,extra)} {weight multiplier} {item})
# example=(0 lots 15 dirt 1 extra 1 minecraft:burried_treasure)
oak_log=(0 lots 15 oak_log 1 extra 1 lucky_equip:wood_equip)
spruce_log=(0 lots 15 spruce_log 1 extra 1 lucky_equip:wood_equip)
birth_log=(0 lots 15 birth_log 1 extra 1 lucky_equip:wood_equip)
jungle_log=(0 lots 15 jungle_log 1 extra 1 lucky_equip:wood_equip)
acacia_log=(0 lots 15 acacia_log 1 extra 1 lucky_equip:wood_equip)
dark_oak_log=(0 lots 15 dark_oak_log 1 extra 1 lucky_equip:wood_equip)
crimson_stem=(0 lots 30 crimson_stem 1 extra 1 lucky_equip:wood_equip 1 extra lucky_item:fire_stick)
warped_stem=(0 lots 30 warped_stem 1 extra 1 lucky_equip:wood_equip 1 extra lucky_item:fire_stick)
stone=(0 lots 15 cobblestone 1 extra 1 lucky_equip:stone_equip)
deepslate=(0 lots 15 cobbled_deepslate 1 extra 1 lucky_equip:deepslate_equip)
obsidian=(0 lots 3 obsidian 1 extra 1 lucky_equip:obsidian_equip)
iron_ore=(0 lots 3 iron_ingot 1 extra 1 lucky_equip:iron_equip)
copper_ore=(0 lots 3 copper_ingot 1 extra 1 lucky_equip:soft_iron_equip)
gold_ore=(0 lots 3 gold_ingot 1 extra 1 lucky_equip:gold_equip)
diamond_ore=(0 lots 1 diamond 1 extra 1 lucky_equip:diamond_equip)

progressive_weight=( 48 12 3  1)
progressive_quality=(-8 5  2  1)
progressive_count=(  1  4  16 64)
progressive_items=(oak_log spruce_log birth_log jungle_log acacia_log dark_oak_log crimson_stem warped_stem cobblestone cobbled_deepslate obsidian iron_ingot \
                   copper_ingot gold_ingot diamond)
