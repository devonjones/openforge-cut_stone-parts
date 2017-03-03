// 50 - 11.2 = 38.8
// 38.8 - 4.9 = 33.9
// .9 * 5 + .4 = 4.9
// 33.9 / 6 = 5.65
// 5.65 * 1.618 = 9.1417

size = 2;
height = 5;
width=10.2;
external = true;
render_cut_stone_corner_column = false;
lower = false;
upper = false;
sides = [
    [16,100,96,120,144,41,69,112,140,164,184,71,95,165],
    [145,121,40,97,124,149,185,93,113,139,163,47,117,188],
    [148,146,98,122,64,125,46,138,166,23,114,162,186,94],
    [101,99,17,123,88,147,189,70,116,45,115,137,161,187]];

/*
 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23 -
24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47 -
48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68.69,70,71 -
72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95 -
96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117
120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140
144,145,146,147,148,149,150,151,152,153,154,155,156,157,159,160,161,162,163,164,165,166
168,169,170,171,172,173,174,175,175,177,178,179,180,181,182,183,184,185,186,187,188,189
*/

/*
0
24
48
72
96
120
144
168
*/


module wall_block_load(f, path="../") {
    //x,y,z
    //0,0,0
    //0,1,0
    //0,2,0
    //0,3,0
    //1,0,0
    //-1,0,0
    transform = f % 24;
    side = floor(transform % 6);
    angle = floor(transform / 6);
    block = floor(f / 24);
    echo(str("selection: ", floor(f), " side: ", side, " angle: ", angle, " block: ", block));
    
    if (side < 4) {
        x = side;
        y = 0;
    } else {
        x = 0;
        if (side == 4) {
            y = 1;
        } else {
            y = -1;
        }
    }
    rotate([side < 4 ? side*90:0,side == 4 ? -90 : side == 5 ? 90:0,angle*90]) import(str(path, "blocks/block_light_pitting_", block < 10 ? "0":"", block, ".stl"));
}

module block(x,y,z,block_num) {
    color("Gray") scale([x/10,y/10,z/10]) translate([5,5,5]) wall_block_load(block_num);
}

module corner_column_internal_1x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([10.2-0.5,25-9.2,0]) cube([width+14.8-10.2-0.5,width-2,outerh-0.9]);
            color("LightGrey") translate([25-9.2,10.2-0.5,0]) cube([width-2,25-width-0.5,outerh-0.9]);
        }
        if (lower) {
            color("LightGrey") cube([50,50,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([10.2,25-10.2,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([19.3,25-5.7,hoffset]) block(width-4.5,width-4.5,h,sides[1][i]);

                translate([25-10.2,10.2,hoffset]) block(width,9.2,h,sides[2][i]);
            } else {
                translate([5.1,25-10.2,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([25-10.2,5.1,hoffset]) block(width,9.2,h,sides[1][i]);
                translate([15.3,25-9.7,hoffset]) block(width-0.5,width-0.5,h,sides[2][i]);

                if(i == height) {
                    color("LightGrey") translate([5.1-0.5,25-9.2,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([25-9.2,5.1-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([5.1-0.5,25-9.2,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([25-9.2,5.1-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_internal_2x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([30.6-0.5,50-9.2,0]) cube([width+8.7,width-2,outerh-0.9]);
            color("LightGrey") translate([50-9.2,30.6-0.5,0]) cube([width-2,18.9,outerh-0.9]);
        }
        if (lower) {
            color("LightGrey") cube([75,75,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([30.6,50-10.2,hoffset]) block(9.1,width,h,sides[0][i]);
                translate([50-10.2,30.6,hoffset]) block(width,9.1,h,sides[1][i]);

                translate([40.8,50-9.2,hoffset]) block(width-1,width-1,h,sides[2][i]);
            } else {
                translate([25.5,50-10.2,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([50-10.2,25.5,hoffset]) block(width,9.2,h,sides[1][i]);

                translate([35.7,50-10.2,hoffset]) block(width+4.1,width,h,sides[2][i]);
                translate([50-10.2,35.7,hoffset]) block(width,4.2,h,sides[3][i]);

                if(i == height) {
                    color("LightGrey") translate([25.5-0.5,50-9.2,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([50-9.2,25.5-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([25.5-0.5,50-9.2,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([50-9.2,25.5-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_internal_3x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([61.2-0.5,75-9.2,0]) cube([13.3,width-2,outerh-.9]);
            color("LightGrey") translate([75-9.2,61.2-0.5,0]) cube([width-2,width+3.1,outerh-.9]);
        }
        if (lower) {
            color("LightGrey") cube([100,100,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([61.2,75-10.2,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([75-10.2,61.2,hoffset]) block(width,9.2,h,sides[2][i]);

                translate([70.3,75-4.7,hoffset]) block(width-5.5,width-5.5,h,sides[2][i]);
            } else {
                translate([56.1,75-10.2,hoffset]) block(8.6,width,h,sides[0][i]);
                translate([75-10.2,56.1,hoffset]) block(width,8.6,h,sides[1][i]);

                translate([65.8,75-9.2,hoffset]) block(width-1,width-1,h,sides[2][i]);

                if(i == height) {
                    color("LightGrey") translate([56.1-0.5,75-9.2,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([75-9.2,56.1-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([56.1-0.5,75-9.2,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([75-9.2,56.1-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_internal_4x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([81.6-0.5,100-9.2,0]) cube([width+7.7,width-2,outerh-.9]);
            color("LightGrey") translate([100-9.2,81.6-0.5,0]) cube([width-2,17.9,outerh-.9]);
        }
        if (lower) {
            color("LightGrey") cube([125,125,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([81.6,100-10.2,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([100-10.2,81.6,hoffset]) block(width,9.2,h,sides[1][i]);

                translate([91.8,100-8.2,hoffset]) block(width-2,width-2,h,sides[2][i]);
            } else {
                translate([76.5,100-10.2,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([100-10.2,76.5,hoffset]) block(width,9.2,h,sides[1][i]);

                translate([86.7,100-10.2,hoffset]) block(width+3.1,width,h,sides[2][i]);
                translate([100-10.2,86.7,hoffset]) block(width,3.2,h,sides[3][i]);

                if(i == height) {
                    color("LightGrey") translate([76.5-0.5,100-9.2,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([100-9.2,76.5-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([76.5-0.5,100-9.2,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([100-9.2,76.5-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_external_1x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([20.4-0.5,26,0]) cube([width+4.1,width-2,outerh-0.9]);
            color("LightGrey") translate([26,20.4-0.5,0]) cube([width-2,14.3,outerh-0.9]);
        }
        if (lower) {
            color("LightGrey") cube([50,50,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([20.4,25,hoffset]) block(9.2,width,h,sides[2][i]);
                translate([25,20.4,hoffset]) block(width,9.2,h,sides[0][i]);

                translate([29.5,25+10.2-5.7,hoffset]) block(width-4.5,width-4.5,h,sides[1][i]);
            } else {
                translate([15.3,25,hoffset]) block(8.7,width,h,sides[0][i]);
                translate([25,15.3,hoffset]) block(width,8.7,h,sides[1][i]);

                translate([25,25,hoffset]) block(width,width,h,sides[2][i]);

                if(i == height) {
                    color("LightGrey") translate([15.3-0.5,26,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([26,15.3-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([15.3-0.5,26,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([26,15.3-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_external_2x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([40.8-0.5,51,0]) cube([width+8.7,width-2,outerh-0.9]);
            color("LightGrey") translate([51,40.8-0.5,0]) cube([width-2,18.9,outerh-0.9]);
        }
        if (lower) {
            color("LightGrey") cube([50+12.5,50+12.5,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([40.8,50,hoffset]) block(9.1,width,h,sides[0][i]);
                translate([50,40.8,hoffset]) block(width,9.1,h,sides[1][i]);

                translate([51,51,hoffset]) block(width-1,width-1,h,sides[2][i]);
            } else {
                translate([35.7,50,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([50,35.7,hoffset]) block(width,9.2,h,sides[1][i]);

                translate([45.9,50,hoffset]) block(width+4.1,width,h,sides[2][i]);
                translate([50,45.9,hoffset]) block(width,4.2,h,sides[3][i]);
                
                if(i == height) {
                    color("LightGrey") translate([35.7-0.5,51,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([51,35.7-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([35.7-0.5,51,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([51,35.7-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_external_3x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([71.4-0.5,76,0]) cube([width+3.1,width-2,outerh-.9]);
            color("LightGrey") translate([76,71.4-0.5,0]) cube([width-2,13.3,outerh-.9]);
        }
        if (lower) {
            color("LightGrey") cube([100,100,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([71.4,75,hoffset]) block(width+3.6,width,h,sides[0][i]);
                translate([75,71.4,hoffset]) block(width,3.7,h,sides[1][i]);
            } else {
                translate([66.3,75,hoffset]) block(8.6,width,h,sides[0][i]);
                translate([75,66.3,hoffset]) block(width,8.6,h,sides[1][i]);

                translate([76.0,76,hoffset]) block(width-1,width-1,h,sides[2][i]);
                
                if(i == height) {
                    color("LightGrey") translate([66.3-0.5,76,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([76,66.3-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([66.3-0.5,76,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([76,66.3-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module corner_column_external_4x(sides, height=5, width=10.2, lower=false, upper=false) {
    outerh = height == 2 ? 19.15 : height == 5 ? 38.8 : 88.7;
    intersection() {
        union() {
            color("LightGrey") translate([91.8-0.5,101,0]) cube([width+7.7,width-2,outerh-.9]);
            color("LightGrey") translate([101,91.8-0.5,0]) cube([width-2,17.9,outerh-.9]);
        }
        if (lower) {
            color("LightGrey") cube([125,125,38.8+0.45]);
        } if(upper) {
            color("LightGrey") translate([0,0,38.8+0.45]) cube([112.5,112.5,55]);
        }
    }
    for (i = [0:height]) {
        hoffset = i > 5 ? 33.15+(5.45+0.8)*(i-5) : (5.65+0.9)*i+0.4;
        h = i > 5 ? 5.45 : 5.65;
        gap = i > 5 ? 0.8 : 0.9;
        if ((i <= 5 && lower) || (i >5 && upper) || (!lower && !upper)) {
            if (i % 2 == 0) {
                translate([91.8,100,hoffset]) block(width+8.2,width,h,sides[0][i]);
                translate([100,91.8,hoffset]) block(width,8.3,h,sides[1][i]);
            } else {
                translate([86.3,100,hoffset]) block(9.2,width,h,sides[0][i]);
                translate([100,86.3,hoffset]) block(width,9.2,h,sides[1][i]);

                translate([96.3,100,hoffset]) block(width+3.7,width,h,sides[2][i]);
                translate([100,96.3,hoffset]) block(width,3.8,h,sides[3][i]);
                
                if(i == height) {
                    color("LightGrey") translate([86.3-0.5,101,hoffset-gap/2]) cube([8.7,width-2,(h-gap/2)]);
                    color("LightGrey") translate([101,86.3-0.5,hoffset-gap/2]) cube([width-2,8.7,(h-gap/2)]);
                } else {
                    color("LightGrey") translate([86.3-0.5,101,hoffset-gap/2]) cube([8.7,width-2,(h+gap)]);
                    color("LightGrey") translate([101,86.3-0.5,hoffset-gap/2]) cube([width-2,8.7,(h+gap)]);
                }
            }
        }
    }
}

module echo_name(height, size, external=false) {
    echo(x_long=size, external=external);
    if (height < 5) {
        echo("half");
    } else if (height > 5) {
        echo("tall");
    }
}

if (render_cut_stone_corner_column) {
    echo_name(height, size, external);
    if (external) {
        if (size == 1) {
            corner_column_external_1x(sides, height, width, lower, upper);
        } else if (size == 2) {
            corner_column_external_2x(sides, height, width, lower, upper);
        } else if (size == 3) {
            corner_column_external_3x(sides, height, width, lower, upper);
        } else if (size == 4) {
            corner_column_external_4x(sides, height, width, lower, upper);
        }
    } else {
        if (size == 1) {
            corner_column_internal_1x(sides, height, width, lower, upper);
        } else if (size == 2) {
            corner_column_internal_2x(sides, height, width, lower, upper);
        } else if (size == 3) {
            corner_column_internal_3x(sides, height, width, lower, upper);
        } else if (size == 4) {
            corner_column_internal_4x(sides, height, width, lower, upper);
        }
    }
}
