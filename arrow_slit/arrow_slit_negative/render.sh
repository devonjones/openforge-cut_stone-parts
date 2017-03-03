#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	$OPENSCAD -o arrow_slit_negative.${x}x.wall.stl \
			-D 'render_arrow_slit=true' -D 'x=$x' \
			../arrow_slit.scad
	$CONVERTSTL arrow_slit_negative.${x}x.wall.stl
	mv arrow_slit_negative.${x}x.wall-binary.stl arrow_slit_negative.${x}x.wall.stl
done

