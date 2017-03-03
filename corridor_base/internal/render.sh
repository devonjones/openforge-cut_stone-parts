#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	for y in {2..4}
	do
		$OPENSCAD -o cut_stone_corridor_base.${x}x${y}.internal.stl \
				-D 'render_cut_stone_corridor_base=true' -D "x=$x" -D "y=$y" \
				../cut_stone_corridor_base.scad
		$CONVERTSTL cut_stone_corridor_base.${x}x${y}.internal.stl
		mv cut_stone_corridor_base.${x}x${y}.internal-binary.stl cut_stone_corridor_base.${x}x${y}.internal.stl
	done
done

