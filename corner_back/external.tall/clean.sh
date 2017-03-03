#!/bin/bash
for x in {1..4}
do
	meshlabserver -i cut_stone_corner_back.${x}x.external.tall.stl -o cut_stone_corner_back.${x}x.external.tall.1.ply -s ../../../../meshlab/decimation.1.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.external.tall.1.ply -o cut_stone_corner_back.${x}x.external.tall.2.ply -s ../../../../meshlab/decimation.2.mlx
	meshlabserver -i cut_stone_corner_back.${x}x.external.tall.2.ply -o cut_stone_corner_back.${x}x.external.tall.3.ply -s ../../../../meshlab/decimation.3.mlx
done

