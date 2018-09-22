// Philipps Hue Dimmer Switch wall mount
// Authors:
// - Jonas "frdmn" Friedmann <j@frd.mn>
// - Marian "rnarian" Friedmann <hi@marianfriedmann.de>
// Licence: MIT License (MIT)

$fn = 30;

/*
 * Variables
 */

BASE_DEPTH=11.5;
BASE_CORNERCUTOUT_WIDTH=4;
BASE_CORNERCUTOUT_DEPTH=6.5;
BASE_PILLAR_DIAMETER=2;

BACK_WIDTH=25;
BACK_LENGTH=38;

// Base rectangle
module base (){
    // Cut out space for wall switch
    difference(){
        // Cut out holes for holder bracket clips
        difference(){ 
            // Combine base shell and back cover
            union(){
                difference(){
                    cube([56,56,BASE_DEPTH]);
                    translate([1.5,1.5,0]){
                        cube([56-1.5*2,56-1.5*2,BASE_DEPTH-1.5]);
                    }
                }
                back();
            }
            translate([6.2+1.25,6.5+1.25,10]){
                cylinder(h=3, d=2.5);
                translate([18.05+2.5,0,0]){
                    cylinder(h=3, d=2.5);
                    translate([18.05+2.5,0,0]){
                        cylinder(h=3, d=2.5);
                        // Right (horitonally) ones
                        translate([0,17.75+2.5,0]){
                            cylinder(h=3, d=2.5);
                            translate([0,17.75+2.5,0]){
                                cylinder(h=3, d=2.5);
                            }
                        }
                    }
                }
                 // Left (horitonally) ones
                translate([0,17.75+2.5,0]){
                    cylinder(h=3, d=2.5);
                    translate([0,17.75+2.5,0]){
                        cylinder(h=3, d=2.5);
                    }
                }
            }
        }
        translate([0,(56-15)/2,0]){
            cube([56, 15, 2.5]);
        }
    }
}

// Back/cover extension to hold remote
module back (){
    translate([(56-BACK_WIDTH)/2,56,BASE_DEPTH-1.5]){
        cube([BACK_WIDTH,BACK_LENGTH,1.5]);
    }
}

// Cutout for corners
module cornerCutout() {
    cube([BASE_CORNERCUTOUT_WIDTH,BASE_CORNERCUTOUT_WIDTH,BASE_CORNERCUTOUT_DEPTH]);
}

// Cut out corners from base
difference(){
    base();
    union(){
        cornerCutout();
        translate([56-BASE_CORNERCUTOUT_WIDTH,0,0]){
            cornerCutout();
        }
        translate([56-BASE_CORNERCUTOUT_WIDTH,56-BASE_CORNERCUTOUT_WIDTH,0]) {
            cornerCutout();
        }
        translate([0,56-BASE_CORNERCUTOUT_WIDTH,0]){
            cornerCutout();
        }
    }
}

// Pillar for corners
module cornerPillar(){
    translate([(BASE_CORNERCUTOUT_WIDTH-BASE_PILLAR_DIAMETER)/2,(BASE_CORNERCUTOUT_WIDTH-BASE_PILLAR_DIAMETER)/2,1.5]){
        cylinder(h=BASE_CORNERCUTOUT_DEPTH-1.5,d=BASE_PILLAR_DIAMETER);
        sphere(1.5);
    }
}

// Draw pillar and rotate for each corner
cornerPillar();
translate([56,0,0]) {
    rotate(a=90,v=[0,0,1]){
        cornerPillar();
    }
}
translate([56,56,0]) {
    rotate(a=180,v=[0,0,1]){
        cornerPillar();
    }
}
translate([0,56,0]) {
    rotate(a=270,v=[0,0,1]){
        cornerPillar();
    }
}

