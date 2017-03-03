#!/bin/bash
for x in {1..4}
do
	meshlabserver -i cut_stone_corner_back.${x}x.internal.half.stl -o cut_stone_corner_back.${x}x.internal.half.1.ply -s ../../../../meshlab/decimation.1.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.internal.half.1.ply -o cut_stone_corner_back.${x}x.internal.half.2.ply -s ../../../../meshlab/decimation.2.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.internal.half.2.ply -o cut_stone_corner_back.${x}x.internal.half.3.ply -s ../../../../meshlab/decimation.3.mlx

	#meshlabserver -i cut_stone_corner_back.${x}x.internal.half.inverse.stl -o cut_stone_corner_back.${x}x.internal.half.inverse.1.ply -s ../../../../meshlab/decimation.1.mlx
	#meshlabserver -i cut_stone_corner_back.${x}x.internal.half.inverse.1.ply -o cut_stone_corner_back.${x}x.internal.half.inverse.2.ply -s ../../../../meshlab/decimation.2.mlx
	#meshlabserver -i cut_stone_corner_back.${x}x.internal.half.inverse.2.ply -o cut_stone_corner_back.${x}x.internal.half.inverse.3.ply -s ../../../../meshlab/decimation.3.mlx
done

