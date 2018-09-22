// Philipps Hue Dimmer Switch wall mount
// Authors:
// - Jonas "frdmn" Friedmann <j@frd.mn>
// - Marian "rnarian" Friedmann <hi@marianfriedmann.de>
// Licence: MIT License (MIT)

$fn = 30;

HOLDER_HEIGHT=2;
CLIP_HEIGHT=5;

// Holder brackt that keeps the dimmer switch in place
module holder(){
    // Function to draw an retangle with rounded corners
    module rounded_square(d,r) {
        minkowski() {
            translate([r,r]) square([d[0]-2*r, d[1]-2*r]);
            circle(r);
        }
    }

    difference(){
        linear_extrude(height=HOLDER_HEIGHT){
            rounded_square([46.6,46],5);
        }
        translate([5.5,5.5,0]){
            linear_extrude(height=HOLDER_HEIGHT){
                rounded_square([35.6,46], 2);
            }
        }
    }
}

// Clips to keep the holder in the base plate
module clip(){
    difference(){
        cylinder(h=CLIP_HEIGHT,d=2.5);
        translate([-2,-0.25,2.5]){
            cube([4,0.5,3]);
        }
    }
}

// Draw holder
holder();

// Draw each of the clips
translate([1.5+2.5/2,1.5+2.5/2,0]){
    // Bottom ones
    clip();
    translate([18.05+2.5,0,0]){
        clip();
        translate([18.05+2.5,0,0]){
            clip();
            // Right (horitonally) ones
            translate([0,17.75+2.5,0]){
                clip();
                translate([0,17.75+2.5,0]){
                    clip();
                }
            }
        }
    }
     // Left (horitonally) ones
    translate([0,17.75+2.5,0]){
        clip();
        translate([0,17.75+2.5,0]){
            clip();
        }
    }
}
