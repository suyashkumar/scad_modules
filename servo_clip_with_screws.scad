/*
 * Experimental micro servo mount
 * (meant to be printable upright with the clip facing upwards).
 * All measurements are in mm. 
 * @author: Suyash Kumar <suyash@suyashkumar.com>
 */
$fn = 100;
// All measurements in mm
servo_length = 23; 

servo_holder_width = 10; 
servo_holder_height = 14.5;
servo_holder_depth = 2;

clip_width = 1.5;
clip_overhang = 1.5;

screw_hole_z = 9;
screw_hole_x = -1.2;

module servo_clip_handle(clip) {
    difference() {
        union() {
            cube([clip_width, servo_holder_width, servo_holder_height]);
            if (clip){
                translate([0, 0, servo_holder_height])cube([clip_width + clip_overhang, servo_holder_width, servo_holder_depth]);
            }
            translate([-4, 0, 0])cube([4, servo_holder_width, servo_holder_height]);
        }
        translate([screw_hole_x, 0, screw_hole_z])rotate([90, 0, 0])cylinder(d=1.8, h=100, center=true);
    }
}

module servo_clip(clip = false) {
    union() {
        cube([25, servo_holder_width, servo_holder_depth]);
        servo_clip_handle(clip);
        translate([servo_length + 2*clip_width, 0,0])mirror([1,0,0])servo_clip_handle(clip);
    }
}

servo_clip(true);