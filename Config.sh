#!/bin/bash

equip_materials=(wood_equip stone_equip hard_stone_equip harder_stone_equip iron_equip soft_iron_equip gold_equip diamond_equip)
wood_equip=(wood wooden leather 2 0.1)
stone_equip=(stone stone chain 3 0.2)
hard_stone_equip=(deepslate stone chain 4 0.2)
harder_stone_equip=(obsidian stone chain 5 0.2)
iron_equip=(iron iron iron 4 0.3)
soft_iron_equip=(copper iron iron 3 0.3)
gold_equip=(gold gold gold 4 0.4)
diamond_equip=(diamond diamond diamond 5 0.5)

lots_weight=( 48 12 3  1)
lots_quality=(-8 5  2  1)
lots_count=(  1  4  16 64)
extra_weight=64
extra_quality=16
extra_count=1

#blocks=(oak_log spruce_log birth_log jungle_log acacia_log dark_oak_log crimson_stem warped_stem stone deepslate obsidian iron_ore copper_ore gold_ore \
#        diamond_ore)
# format: {name}=({type(0,1)}{weight(lots,extra)}{item})
blocks=(diamond_ore iron_ore)
oak_log=
spruce_log=
birth_log=
jungle_log=
acacia_log=
dark_oak_log=
crimson_stem=
warped_stem=
stone=
deepslate=
obsidian=
iron_ore=(0 lots diamond)
copper_ore=
gold_ore=
diamond_ore=(0 lots diamond)