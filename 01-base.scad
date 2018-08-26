// Philipps Hue Dimmer Switch wall mount
// Author: Jonas "frdmn" Friedmann <j@frd.mn>
// Licence: Creative Commons Attribution-ShareAlike 4.0 International License

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
    difference(){
        union(){
            difference(){
                cube([56,56,BASE_DEPTH]);
                translate([1.5,1.5,0]){
                    cube([56-1.5*2,56-1.5*2,BASE_DEPTH-1.5]);
                }
            }
            back();
        }
        
        // Cut out spacer for wall mount clip
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