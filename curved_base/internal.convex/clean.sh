#!/bin/bash
for x in {1..4}
do
        for y in {1..4}
        do
                meshlabserver -i cut_stone_curved_base.${x}x${y}.internal.stl -o cut_stone_curved_base.${x}x${y}.internal.1.ply -s ../../../../meshlab/decimation.3.mlx
        done
done

