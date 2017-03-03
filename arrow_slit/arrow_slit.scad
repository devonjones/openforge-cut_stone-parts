module arrow_slit_negative() {
    translate([-25,0,6.05]) color("Grey") {
        hull() {
            translate([24,0,0]) cube([2,24,24]);
            translate([3,-1,0]) cube([44,1,38]);
        }
        translate([24,0,0]) cube([2,30,24]);
    }
}

module arrow_mortar_negative() {
    translate([-25,0,6.05]) color("LightGrey") {
        hull() {
            translate([23,0,-1]) cube([4,24,26]);
            translate([2,-1,-1]) cube([46,1,40]);
        }
    }
}

module mortar() {
    color("LightGrey") {
        for ( i = [0 : 5] ) {
            translate([0,0,(5.65+0.9)*i-0.5]) cube([100,24,0.9]);
            if (i % 2 == 0) {
                for ( j = [1:9] ) {
                    translate([10.2*j-1,0,(5.65+0.9)*(i)]) cube([1,24,5.65+0.9]);
                }
            } else {
                for ( j = [0:9] ) {
                    translate([10.2*j-1+5.1,0,(5.65+0.9)*(i)]) cube([1,24,5.65+0.9]);
                }
            }
        }
    }
}

module arrow_slit(position) {
    translate([0,-16,0]) {
        translate([position,0,0]) arrow_slit_negative();
        intersection() {
            translate([position,0,0]) arrow_mortar_negative();
            mortar();
        }
    }
}

x = 4.5;
position = x * 25/2;
render_arrow_slit = false;

if (render_arrow_slit) {
    arrow_slit(position);
}