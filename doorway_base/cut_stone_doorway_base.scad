include <../../floor/cut_stone_floor.scad>

x = 2;
y = 2;
external = false;
render_cut_stone_doorway_base = false;

module cut_stone_doorway_base(x,y) {
    difference() {
        union() {
            difference() {
                color("LightGrey") translate([1,25*y-9.2,1.5]) cube([25*x-2,8.2,3.7]);
                if (x == 2) {
                    color("LightGrey") translate([7,-6.4+y*25-10.2,-4]) cube([36,13,24]);
                    color("LightGrey") translate([9,-1.8+y*25-10.2,-4]) cube([32,12.1,24]);
                    color("LightGrey") translate([7,-4.4+y*25-10.2,-4]) cube([31,13,24]);
                } else if (x == 3) {
                    color("LightGrey") translate([11,-6.4+y*25-10.2,-4]) cube([53,15,24]);
                    color("LightGrey") translate([13,-1.8+y*25-10.2,-4]) cube([49,12.1,24]);
                } else if (x == 4) {
                    color("LightGrey") translate([11+12.5,-6.4+y*25-10.2,-4]) cube([53,15,24]);
                    color("LightGrey") translate([13+12.5,-1.8+y*25-10.2,-4]) cube([49,12.1,24]);
                }
            }
            static_cut_stone_floors(x,y,false,false,path="../");
        }
        if (x == 2) {
            color("Grey") translate([11,3.7+y*25-10.2,1]) cylinder(50,1,1,$fn=25);
        } else if (x == 3) {
            color("Grey") translate([15,3.7+y*25-10.2,-3.7]) cylinder(60,1,1,$fn=25);
            color("Grey") translate([60,3.7+y*25-10.2,-3.7]) cylinder(60,1,1,$fn=25);
        } else if (x == 4) {
            color("Grey") translate([15+12.5,3.7+y*25-10.2,-3.7]) cylinder(60,1,1,$fn=25);
            color("Grey") translate([60+12.5,3.7+y*25-10.2,-3.7]) cylinder(60,1,1,$fn=25);
        }
    }
}

module cut_stone_external_doorway_base(x,y) {
    union() {
        color("LightGrey") translate([1,25*y+1,1.5]) cube([25*x-2,12.5-2,3.7]);
        static_cut_stone_floors(x,y+1,false,true,path="../");
    }
}

if (render_cut_stone_doorway_base) {
    if (external) {
        cut_stone_external_doorway_base(x,y);
    } else {
        cut_stone_doorway_base(x,y);
    }
}