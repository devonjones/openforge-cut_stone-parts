include <../../floor/cut_stone_floor.scad>

x = 1;
y = 1;
external = false;
render_cut_stone_curved_base = false;

module cut_stone_curved_base(x,y) {
    union() {
        color("LightGrey") intersection() {
            translate([0,0,0]) difference() {
                scale([x < y ? ((25*x)-1)/((25*y)-1) : 1, y < x ? ((25*y)-1)/((25*x)-1) : 1,1]) translate([0,0,0]) cylinder(3.7+1.5,max([x, y])*25-1, max([x,y])*25-1,$fn=100);
                scale([x < y ? ((25*x)-9.2)/((25*y)-9.2) : 1, y < x ? ((25*y)-9.2)/((25*x)-9.2) : 1,1]) translate([0,0,-1]) cylinder(10,max([x, y])*25-9.2, max([x,y])*25-9.2,$fn=100);
            }
            translate([1,1,0]) cube([25*x-2,25*y-2,10]);
        }
        intersection() {
            static_cut_stone_floors(x,y,false,false,path="../");
            color("LightGrey") union() {
                translate([0,0,0]) scale([x < y ? ((25*x)-9.2)/((25*y)-9.2) : 1, y < x ? ((25*y)-9.2)/((25*x)-9.2) : 1,1]) cylinder(10,max([x, y])*25-9.1, max([x,y])*25-9.1,$fn=100);
                //#translate([0,0,-1]) scale([x < y ? (25*x)/(25*y) : 1, y < x ? (25*y)/(25*x) : 1,1]) cylinder(2.5,max([x, y])*25, max([x,y])*25,$fn=100);
            }
        }
    }
}

module cut_stone_external_curved_base(x,y) {
    union() {
        color("LightGrey") intersection() {
            translate([0,0,0]) difference() {
                scale([x < y ? ((25*x)+11.5)/((25*y)+11.5) : 1, y < x ? ((25*y)+11.5)/((25*x)+11.5) : 1,1]) translate([0,0,0]) cylinder(3.7+1.5,max([x, y])*25+11.5, max([x,y])*25+11.5,$fn=100);
                scale([x < y ? ((25*x)+1)/((25*y)+1) : 1, y < x ? ((25*y)+1)/((25*x)+1) : 1,1]) translate([0,0,-1]) cylinder(10,max([x, y])*25+1, max([x,y])*25+1,$fn=100);
            }
            translate([1,1,0]) cube([x*25+10.5,y*25+10.5,1.5+3.7]);
        }
        
        /*color("LightGrey") intersection() {
            #scale([x < y ? ((25*x)+12.5)/((25*y)+12.5) : 1, y < x ? ((25*y)+12.5)/((25*x)+12.5) : 1,1]) translate([0,0,0]) cylinder(1.5,max([x, y])*25+12.5, max([x,y])*25+12.5,$fn=100);
            cube([x*25+12.5,y*25+12.5,1.5+3.7]);
        }*/

        intersection() {
            static_cut_stone_floors(x+1,y+1,true,true,false,false,path="../");
            translate([0,0,-1]) scale([x < y ? ((25*x)+1)/((25*y)+1) : 1, y < x ? ((25*y)+1)/((25*x)+1) : 1,1]) cylinder(10,max([x, y])*25+1, max([x,y])*25+1,$fn=100);
        }
    }
}

if (render_cut_stone_curved_base) {
    if (external) {
        cut_stone_external_curved_base(x,y);
    } else {
        cut_stone_curved_base(x,y);
    }
}