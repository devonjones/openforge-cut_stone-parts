#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	$OPENSCAD -o cut_stone_corner_base.${x}x${x}.external.stl \
			-D 'render_cut_stone_corner_base=true' -D 'external=true' -D "x=$x" -D "y=$x" \
			../cut_stone_corner_base.scad
	$CONVERTSTL cut_stone_corner_base.${x}x${x}.external.stl
	mv cut_stone_corner_base.${x}x${x}.external-binary.stl cut_stone_corner_base.${x}x${x}.external.stl
done

