#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	$OPENSCAD -o cut_stone_corner_base.${x}x${x}.internal.stl \
			-D 'render_cut_stone_corner_base=true' -D 'external=false' -D "x=$x" -D "y=$x" \
			../cut_stone_corner_base.scad
	$CONVERTSTL cut_stone_corner_base.${x}x${x}.internal.stl
	mv cut_stone_corner_base.${x}x${x}.internal-binary.stl cut_stone_corner_base.${x}x${x}.internal.stl
done

