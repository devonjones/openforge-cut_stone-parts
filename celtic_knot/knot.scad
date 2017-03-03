use <lib/celtic-knots.scad>

tile = 12;

module floor_block_load(f, path="../") {
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

module cut_stone_tile(tile_num, path="../") {
    //color("LightGrey") cube([25, 25, 1.5]);
    intersection() {
        color("Grey") scale([2.4, 2.4, 1]) translate([5.209, 5.209,-.5]) floor_block_load(tile_num,path=path);
        color("Grey") cube([25,25,4.5]);
    }
}
knot = ["<~~", "!&& ", "!&s"];
//knot = ["!&;", "!&;", "!&;"];
//knot = ["~~~", "&&& ", "a&s"];
//knot = ["w&e", "&&& ", "a&s"];

cut_stone_tile(tile);
//translate([12.5,12.5,0]) color("LightGrey") knot(knot, 4.3, 5,undef,0);
//translate([12.5,12.5,0]) color("LightGrey") knot(knot, 3.7, 5,undef,0);

//translate([12.5,12.5,0]) color("LightGrey") knot(knot, 4, 4.3,undef,0.5);
