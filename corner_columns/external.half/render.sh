#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	#$OPENSCAD -o cut_stone_corner_column.${x}x.external.half.stl \
	#		-D 'render_cut_stone_corner_column=true' -D "external=true" -D "size=${x}" -D "height=2" -D "width=12.5" \
	#		../cut_stone_corner_columns.scad
	#$CONVERTSTL cut_stone_corner_column.${x}x.external.half.stl
	#mv cut_stone_corner_column.${x}x.external.half-binary.stl cut_stone_corner_column.${x}x.external.half.stl

	$OPENSCAD -o cut_stone_corner_column.${x}x.external.half.inverse.stl \
			-D 'render_cut_stone_corner_column=true' -D "external=false" -D "size=${x}" -D "height=2" -D "width=12.5" \
			../cut_stone_corner_columns.scad
	$CONVERTSTL cut_stone_corner_column.${x}x.external.half.inverse.stl
	mv cut_stone_corner_column.${x}x.external.half.inverse-binary.stl cut_stone_corner_column.${x}x.external.half.inverse.stl
done

