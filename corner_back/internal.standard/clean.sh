#!/bin/bash
for x in {1..4}
do
	meshlabserver -i cut_stone_corner_back.${x}x.internal.standard.stl -o cut_stone_corner_back.${x}x.internal.standard.1.ply -s ../../../../meshlab/decimation.1.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.internal.standard.1.ply -o cut_stone_corner_back.${x}x.internal.standard.2.ply -s ../../../../meshlab/decimation.2.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.internal.standard.2.ply -o cut_stone_corner_back.${x}x.internal.standard.3.ply -s ../../../../meshlab/decimation.3.mlx

	meshlabserver -i cut_stone_corner_back.${x}x.internal.standard.inverse.stl -o cut_stone_corner_back.${x}x.internal.standard.inverse.1.ply -s ../../../../meshlab/decimation.1.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.internal.standard.inverse.1.ply -o cut_stone_corner_back.${x}x.internal.standard.inverse.2.ply -s ../../../../meshlab/decimation.2.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.internal.standard.inverse.2.ply -o cut_stone_corner_back.${x}x.internal.standard.inverse.3.ply -s ../../../../meshlab/decimation.3.mlx
done

