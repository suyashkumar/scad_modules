/*
 * Experimental micro servo mount for screwless mounting
 * (meant to be printed upright with the clip facing upwards)
 * @author: Suyash Kumar <suyash@suyashkumar.com>
 */

// All measurements in mm
servo_length = 23; 
servo_holder_width = 10; 
servo_holder_height = 13;

clip_width = 1.5; 


module servo_clip_handle() {
    union() {
        cube([clip_width, servo_holder_width, servo_holder_height + 1.5]);
        translate([0, 0, servo_holder_height + 1.5])cube([3, servo_holder_width, 2]);
    }
}

module servo_clip(){
    union() {
        cube([25,10,2]);
        servo_clip_handle();
        translate([servo_length + 2*clip_width, 0,0])mirror([1,0,0])servo_clip_handle();
    }
}

servo_clip();
