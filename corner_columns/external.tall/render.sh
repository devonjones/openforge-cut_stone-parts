#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	#$OPENSCAD -o cut_stone_corner_column.${x}x.external.tall.lower.stl \
	#		-D 'render_cut_stone_corner_column=true' -D "external=true" -D "size=${x}" -D "height=13" -D "width=12.5" -D "lower=true" \
	#		../cut_stone_corner_columns.scad
	#$CONVERTSTL cut_stone_corner_column.${x}x.external.tall.lower.stl
	#mv cut_stone_corner_column.${x}x.external.tall.lower-binary.stl cut_stone_corner_column.${x}x.external.tall.lower.stl

	#$OPENSCAD -o cut_stone_corner_column.${x}x.external.tall.upper.stl \
	#		-D 'render_cut_stone_corner_column=true' -D "external=true" -D "size=${x}" -D "height=13" -D "width=12.5" -D "upper=true" \
	#		../cut_stone_corner_columns.scad
	#$CONVERTSTL cut_stone_corner_column.${x}x.external.tall.upper.stl
	#mv cut_stone_corner_column.${x}x.external.tall.upper-binary.stl cut_stone_corner_column.${x}x.external.tall.upper.stl

	$OPENSCAD -o cut_stone_corner_column.${x}x.external.tall.lower.inverse.stl \
			-D 'render_cut_stone_corner_column=true' -D "external=false" -D "size=${x}" -D "height=13" -D "width=12.5" -D "lower=true" \
			../cut_stone_corner_columns.scad
	$CONVERTSTL cut_stone_corner_column.${x}x.external.tall.lower.inverse.stl
	mv cut_stone_corner_column.${x}x.external.tall.lower.inverse-binary.stl cut_stone_corner_column.${x}x.external.tall.lower.inverse.stl

	$OPENSCAD -o cut_stone_corner_column.${x}x.external.tall.upper.inverse.stl \
			-D 'render_cut_stone_corner_column=true' -D "external=false" -D "size=${x}" -D "height=13" -D "width=12.5" -D "upper=true" \
			../cut_stone_corner_columns.scad
	$CONVERTSTL cut_stone_corner_column.${x}x.external.tall.upper.inverse.stl
	mv cut_stone_corner_column.${x}x.external.tall.upper.inverse-binary.stl cut_stone_corner_column.${x}x.external.tall.upper.inverse.stl
done

