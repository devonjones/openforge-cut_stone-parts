#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	for y in {1..4}
	do
		echo "${x}x${y}"
		$OPENSCAD -o cut_stone_corridor_base.${x}x${y}.external.stl \
				-D 'render_cut_stone_corridor_base=true' -D 'external=true' \
				-D "x=$x" -D "y=$y" \
				../cut_stone_corridor_base.scad
		$CONVERTSTL cut_stone_corridor_base.${x}x${y}.external.stl
		mv cut_stone_corridor_base.${x}x${y}.external-binary.stl cut_stone_corridor_base.${x}x${y}.external.stl
	done
done

