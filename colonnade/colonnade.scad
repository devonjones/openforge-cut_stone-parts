// 50 - 11.2 = 38.8
// 38.8 - 0.4 = 34.4
// 0.9 * 5 + 0.4 = 4.9
// 38.8 - 4.9 = 33.9
// 33.9 / 6 = 5.65
// 5.65 * 1.618 = 9.1417

// 100 - 11.2 = 88.8
// .8 * 8 = 6.4
// 50 - 6.4 = 43.6
// 43.6 / 8 = 5.45

module block(x,y,z) {
    color("Grey") cube([x,y,z]);
}

module doorway_mortar_4x() {
    outerh = 43.8;
    difference() {
        color("LightGrey") translate([1,1,0]) cube([98,8.2,outerh-0.9]);
        color("LightGrey") door_negative_2x(border=1);
        color("LightGrey") translate([50,0,0]) door_negative_2x(border=1);
    }
}

// 41.8 tall
// 12 wide at base

module doorway_blocks_2x() {
    height=6;
    outerh = 43.8;
    difference() {
        union() {
            difference() {
                intersection() {
                    union() {
                        for (i = [0:height]) {
                            hoffset = (5.65+0.9)*i+0.4;
                            h = 5.65;
                            if (i < 3) {
                                if (i % 2 == 0) {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(9.2,10.2,h);
                                } else {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(9.2,10.2,h);
                                }
                            } else {
                                if (i % 2 == 0) {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([10.2,0,hoffset]) block(9.2,10.2,h);
                                    translate([20.4,0,hoffset]) block(9.2,10.2,h);
                                    translate([30.6,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(9.2,10.2,h);
                                } else {
                                    translate([0,0,hoffset]) block(4.1,10.2,h);
                                    translate([5.1,0,hoffset]) block(9.2,10.2,h);
                                    translate([15.3,0,hoffset]) block(9.2,10.2,h);
                                    translate([25.5,0,hoffset]) block(9.2,10.2,h);
                                    translate([35.7,0,hoffset]) block(9.2,10.2,h);
                                    translate([45.9,0,hoffset]) block(9.2,10.2,h);
                                }
                            }
                        }
                    }
                    color("Grey") translate([-1,-1,0]) cube([51,12.2,42.8]);
                }
                difference() {
                    color("Grey") translate([25,11.2,19]) rotate([90,0,0]) scale([1,.95,1]) cylinder(12.2,24,24,$fn=100);
                    color("Grey") translate([0,-1,0]) cube([50,12.2,20]);
                }
            }
            arch_stones();
        }
        color("Grey") door_negative_2x(border=0);
    }
}

module doorway_blocks_4x() {
    height=6;
    outerh = 43.8;
    difference() {
        union() {
            difference() {
                intersection() {
                    union() {
                        for (i = [0:height]) {
                            hoffset = (5.65+0.9)*i+0.4;
                            h = 5.65;
                            if (i < 3) {
                                if (i % 2 == 0) {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(8.7,10.2,h);
                                    translate([50.5,0,hoffset]) block(9.2,10.2,h);
                                    translate([91.8,0,hoffset]) block(9.2,10.2,h);
                                } else {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(8.7,10.2,h);
                                    translate([50.5,0,hoffset]) block(9.2,10.2,h);
                                    translate([85.7,0,hoffset]) block(19.2,10.2,h);
                                }
                            } else {
                                if (i % 2 == 0) {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([10.2,0,hoffset]) block(9.2,10.2,h);
                                    translate([20.4,0,hoffset]) block(9.2,10.2,h);
                                    translate([30.6,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(9.2,10.2,h);
                                    translate([51.0,0,hoffset]) block(9.2,10.2,h);
                                    translate([61.2,0,hoffset]) block(9.2,10.2,h);
                                    translate([71.4,0,hoffset]) block(9.2,10.2,h);
                                    translate([81.6,0,hoffset]) block(9.2,10.2,h);
                                    translate([91.8,0,hoffset]) block(9.2,10.2,h);
                                } else {
                                    translate([0,0,hoffset]) block(4.1,10.2,h);
                                    translate([5.1,0,hoffset]) block(9.2,10.2,h);
                                    translate([15.3,0,hoffset]) block(9.2,10.2,h);
                                    translate([25.5,0,hoffset]) block(9.2,10.2,h);
                                    translate([35.7,0,hoffset]) block(9.2,10.2,h);
                                    translate([45.9,0,hoffset]) block(9.2,10.2,h);
                                    translate([56.1,0,hoffset]) block(9.2,10.2,h);
                                    translate([66.3,0,hoffset]) block(9.2,10.2,h);
                                    translate([76.5,0,hoffset]) block(9.2,10.2,h);
                                    translate([86.7,0,hoffset]) block(9.2,10.2,h);
                                    translate([96.9,0,hoffset]) block(9.2,10.2,h);
                                }
                            }
                        }
                    }
                    color("Grey") translate([-1,-1,0]) cube([101,12.2,42.8]);
                }
                difference() {
                    color("Grey") translate([25,11.2,19]) rotate([90,0,0]) scale([1,.95,1]) cylinder(12.2,24,24,$fn=100);
                    color("Grey") translate([0,-1,0]) cube([50,12.2,20]);
                }
                translate([50,0,0]) difference() {
                    color("Grey") translate([25,11.2,19]) rotate([90,0,0]) scale([1,.95,1]) cylinder(12.2,24,24,$fn=100);
                    color("Grey") translate([0,-1,0]) cube([50,12.2,20]);
                }
            }
            arch_stones();
            translate([50,0,0]) arch_stones();
        }
        color("Grey") door_negative_2x(border=0);
        color("Grey") translate([50,0,0]) door_negative_2x(border=0);
    }
}



module corner_mortar_2x() {
    outerh = 43.8;
    difference() {
        union() {
            color("LightGrey") translate([1,1,0]) cube([54.2-2,8.2,outerh-0.9]);
            color("LightGrey") translate([55.2-9.2,1,0]) cube([8.2,54.2-1,outerh-0.9]);
        }
        color("LightGrey") door_negative_2x(border=1);
        color("LightGrey") translate([50+0.9,4.1+0.9,0]) rotate([0,0,90]) door_negative_2x(border=1);
    }
}

module corner_blocks_2x() {
    height=6;
    outerh = 43.8;
    difference() {
        union() {
            difference() {
                intersection() {
                    union() {
                        for (i = [0:height]) {
                            hoffset = (5.65+0.9)*i+0.4;
                            h = 5.65;
                            if (i < 3) {
                                if (i % 2 == 0) {
                                    translate([0,0,hoffset]) block(6,10.2,h);
                                    translate([44,0,hoffset]) block(11.1,10.2,h);
                                    translate([44.9,0,hoffset]) block(10.2,11.1,h);
                                    translate([44.9,44+4.2,hoffset]) block(10.2,7,h);
                                } else {
                                    translate([0,0,hoffset]) block(6,10.2,h);
                                    translate([44,0,hoffset]) block(11.1,10.2,h);
                                    translate([44.9,0,hoffset]) block(10.2,11.1,h);
                                    translate([44.9,44+4.2,hoffset]) block(10.2,7,h);
                                }
                            } else {
                                if (i % 2 == 0) {
                                    translate([0,0,hoffset]) block(9.2,10.2,h);
                                    translate([10.2,0,hoffset]) block(9.2,10.2,h);
                                    translate([20.4,0,hoffset]) block(9.2,10.2,h);
                                    translate([30.6,0,hoffset]) block(9.2,10.2,h);
                                    translate([40.8,0,hoffset]) block(9.2,10.2,h);
                                    translate([44.9,11.2,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,21.4,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,31.6,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,41.8,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,52,hoffset]) block(10.2,9.2,h);
                                    translate([51.0,0,hoffset]) block(9.2,10.2,h);
                                    translate([51.0,52,hoffset]) block(10.2,9.2,h);
                                } else {
                                    translate([0,0,hoffset]) block(4.1,10.2,h);
                                    translate([5.1,0,hoffset]) block(9.2,10.2,h);
                                    translate([15.3,0,hoffset]) block(9.2,10.2,h);
                                    translate([25.5,0,hoffset]) block(9.2,10.2,h);
                                    translate([35.7,0,hoffset]) block(9.2,10.2,h);
                                    translate([45.9,0,hoffset]) block(9.2,5.1,h);
                                    translate([44.9,6.1,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,16.3,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,26.5,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,36.7,hoffset]) block(10.2,9.2,h);
                                    translate([44.9,46.9,hoffset]) block(10.2,9.2,h);
                                }
                            }
                        }
                    }
                    color("Grey") translate([-1,-1,0]) cube([55.2+0.9,55.2+.9,42.8]);
                }
                difference() {
                    union() {
                        color("Grey") translate([25,11.2,19]) rotate([90,0,0]) scale([1,.95,1]) cylinder(12.2,24,24,$fn=100);
                        color("Grey") translate([42.5+.9,25+4.2+.9,19]) rotate([90,0,90]) scale([1,.95,1]) cylinder(12.2,24,24,$fn=100);
                    }
                    color("Grey") translate([0,-1,0]) cube([56,56,20]);
                }
            }
            arch_stones();
            translate([54.2+.9,4.2+.9,0]) rotate([0,0,90]) arch_stones();
        }
        color("Grey") door_negative_2x(border=0);
        color("Grey") translate([50+.9,4.2+.9,0]) rotate([0,0,90]) door_negative_2x(border=0);
    }
}

module arch_stones() {
        difference() {
            color("Grey") translate([25,10.2,19]) rotate([90,0,0]) scale([1,.95,1]) cylinder(10.2,23,23,$fn=100);
            color("Grey") translate([0,-1,0]) cube([50,12.2,20]);
            color("Grey") translate([0,-1,outerh]) cube([50,12.2,20]);
            color("Grey") translate([25,-1,19]) rotate([0,12,0]) cube([1,12.2,30]);
            color("Grey") translate([25,-1,19]) rotate([0,36,0]) cube([1,12.2,30]);
            color("Grey") translate([25,-1,19]) rotate([0,60,0]) cube([1,12.2,30]);
            color("Grey") translate([25,-1,19]) mirror([1,0,0]) rotate([0,12,0]) cube([1,12.2,30]);
            color("Grey") translate([25,-1,19]) mirror([1,0,0]) rotate([0,36,0]) cube([1,12.2,30]);
            color("Grey") translate([25,-1,19]) mirror([1,0,0]) rotate([0,60,0]) cube([1,12.2,30]);
        }
}


module door_negative_2x(border=0) {
    union() {
        translate([6-border,-6.4,-4]) cube([38+border*2,18+border,24]);
        translate([25,11.6+border,19]) rotate([90,0,0]) scale([1,.9,1]) cylinder(18+border,19+border,19+border,$fn=100);
    }
}

//translate([0,10.2/2,0]) cube([50,50,1]);
//translate([0,0,0]) corner_blocks_2x();
//corner_mortar_2x();
/*
intersection() {
    translate([0,0,0]) doorway_blocks_2x();
    cube([25,10.2,50]);
}
*/

/*
intersection() {
    translate([0,0,0]) doorway_blocks_4x();
    //cube([75,10.2,50]);
}
*/

/*
intersection() {
    translate([0,0,0]) doorway_mortar_4x();
    //cube([25,10.2,50]);
    cube([49,10.2,50]);
    //cube([75,10.2,50]);
}
*/
