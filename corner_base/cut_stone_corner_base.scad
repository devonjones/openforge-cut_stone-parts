include <../../floor/cut_stone_floor.scad>

x = 2;
y = 2;
external = false;
render_cut_stone_corner_base = false;
sides = [11,107,35,83,63,155,59,87,131,18,179,42,111,27,74,136,51,3,123,75,147,50,134,99,171,17,181,22];

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
    color("Grey") rotate([side < 4 ? side*90:0,side == 4 ? -90 : side == 5 ? 90:0,angle*90]) import(str(path, "blocks/block_light_pitting_", block < 10 ? "0":"", block, ".stl"));
}

module block(x,y,z,side) {
    scale([x/10,y/10,z/10]) translate([5,5,5]) wall_block_load(side);
}

module cut_stone_corner_base(x,y) {
    union() {
        color("LightGrey") translate([1,25*y-9.2,0]) cube([25*x-2,8.2,5.2]);
        color("LightGrey") translate([25*x-9.2,1,0]) cube([8.2,25*y-2,5.2]);
        difference() {
            static_cut_stone_floors(x,y,false,false,path="../");
            color("LightGrey") translate([-1,25*y-9.2,-1]) cube([25*x+2,10.2,6]);
            color("LightGrey") translate([25*x-9.2,-1,-1]) cube([10.2,25*y+2,6]);
        }
    }
    xlength = 25*x-10.2;
    ylength = 25*y-10.2;
    xblocks = floor(xlength / 10.2);
    yblocks = floor(ylength / 10.2);
    union() {
        color("Grey") translate([0,25*y-10.2,0.4]) block(4.1,10.2,4.4,sides[0]);
        for(i = [0:xblocks]) {
            end = 5.1 + 10.2 * i + 9.2;
            color("Grey") translate([5.1+10.2*i,25*y-10.2,0.4]) block(end > xlength ? 9.2 - (end - xlength) : end > (xlength-1) ? 9.2 - (end - xlength + 1) : 9.2,10.2,4.4,sides[i+1]);
        }
        color("Grey") translate([25*x-10.2,0,0.4]) block(10.2,4.1,4.4,sides[xblocks+1]);
        for(i = [0:yblocks]) {
            end = 5.1 + 10.2 * i + 9.2;
            color("Grey") translate([25*x-10.2,5.1+10.2*i,0.4]) block(10.2,end > ylength ? 9.2 - (end - ylength) : end > (ylength-1) ? 9.2 - (end - ylength + 1) : 9.2,4.4,sides[xblocks+i+1]);
        }
        color("Grey") translate([25*x-10.2,25*y-10.2,0.4]) block(10.2,10.2,4.4,sides[xblocks-1]);
    }
}

module cut_stone_external_corner_base(x,y) {
    union() {
        color("LightGrey") translate([1,25*y+1,0]) cube([25*x-2+12.5,12.5-2,5.2]);
        color("LightGrey") translate([1,25*y,0]) cube([25*x-2+12.5,12.5-1,1]);
        color("LightGrey") translate([25*y+1,1,0]) cube([12.5-2,25*x,5.2]);
        color("LightGrey") translate([25*y,1,0]) cube([12.5-1,25*x,1]);
        static_cut_stone_floors(x,y,false,false,path="../");
    }

    xlength = 25*x;
    ylength = 25*y;
    xblocks = floor(xlength / 10.2);
    yblocks = floor(ylength / 10.2);
    union() {
        color("Grey") translate([0,25*y,0.4]) block(4.1,12.5,4.4,sides[0]);
        for(i = [0:xblocks]) {
            end = 5.1 + 10.2 * i + 9.2;
            color("Grey") translate([5.1+10.2*i,25*y,0.4]) block(end > xlength ? 9.2 - (end - xlength) : end > (xlength-1) ? 9.2 - (end - xlength + 1) : 9.2,12.5,4.4,sides[i+1]);
        }

        color("Grey") translate([25*x,0,0.4]) block(12.5,4.1,4.4,sides[0]);
        for(i = [0:yblocks]) {
            end = 5.1 + 10.2 * i + 9.2;
            color("Grey") translate([25*x,5.1+10.2*i,0.4]) block(12.5,end > ylength ? 9.2 - (end - ylength) : end > (ylength-1) ? 9.2 - (end - ylength + 1) : 9.2,4.4,sides[xblocks+i+1]);
        }
        color("Grey") translate([25*x,25*y,0.4]) block(12.5,12.5,4.4,sides[xblocks-1]);
    }
}

if (render_cut_stone_corner_base) {
    if (external) {
        cut_stone_external_corner_base(x,y);
    } else {
        cut_stone_corner_base(x,y);
    }
}