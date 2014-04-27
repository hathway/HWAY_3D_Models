

module large_disc() {
	translate([0,-6,0]) circle(r=14, $fn=200);
}
module small_disc() {
	translate([11,0,0]) circle(r=3, $fn=200);
}
module middle_rectangle() {
	translate([0,-3,0]) square([11,6]);
}

module pieces() {
	union() {
		large_disc();
		small_disc();
		middle_rectangle();
	}
}

module quarter() {
	difference() {
		pieces();
		translate([-16, -30,-1]) square([30,30]);
		translate([-27,-15,-1]) square([30,30]);
	}
}

//large_disc();
//small_disc();
//middle_rectangle();
//quarter();


rotate_extrude(convexity=10, $fn=200)
union() {
	quarter();
	mirror([0,1,0]) quarter();
}
