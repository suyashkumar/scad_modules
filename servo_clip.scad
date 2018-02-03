/*
 * Experimental micro servo mount for screwless mounting
 * (meant to be printable upright with the clip facing upwards).
 * All measurements are in mm. 
 * @author: Suyash Kumar <suyash@suyashkumar.com>
 */

// All measurements in mm
servo_length = 23; 

servo_holder_width = 10; 
servo_holder_height = 14.5;
servo_holder_depth = 2;

clip_width = 1.5;
clip_overhang = 1.5;

module servo_clip_handle() {
    union() {
        cube([clip_width, servo_holder_width, servo_holder_height]);
        translate([0, 0, servo_holder_height])cube([clip_width + clip_overhang, servo_holder_width, servo_holder_depth]);
    }
}

module servo_clip() {
    union() {
        cube([25,servo_holder_width, servo_holder_depth]);
        servo_clip_handle();
        translate([servo_length + 2*clip_width, 0,0])mirror([1,0,0])servo_clip_handle();
    }
}

servo_clip();