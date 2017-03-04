#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	for y in {1..4}
	do
		$OPENSCAD -o cut_stone_curved_base.${x}x${y}.internal.square.stl \
				-D 'render_cut_stone_curved_base=true' -D "x=$x" -D "y=$y" \
				-D "external=false" \
				../cut_stone_curved_base.square.scad
		$CONVERTSTL cut_stone_curved_base.${x}x${y}.internal.square.stl
		mv cut_stone_curved_base.${x}x${y}.internal.square-binary.stl cut_stone_curved_base.${x}x${y}.internal.square.stl
	done
done

