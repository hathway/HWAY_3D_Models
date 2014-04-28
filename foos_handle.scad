
handle_length = 132;

module octoghon2D() {
	translate([6.5,-16])
	polygon(
		points=[ 
			[0,0], [9.5,9.5],
			[9.5,22.5],[0,32],
			[-13,32],[-22.5,22.5],
			[-22.5,9.5],[-13,0]
		],
		paths=[ [0,1,2,3,4,5,6,7] ]
	);
}

module handle_body() {
	linear_extrude(height=handle_length)
	octoghon2D();
}

module rounded_end() {
	translate([0,0,handle_length/2])
	difference() {
		cube(
			[handle_length+2,handle_length+2,handle_length+2], 
			center=true
		);
		sphere(r=handle_length/2, $fn=100);
	}
}

module bar_hole() {
	hole_length = 100;
	translate([0,0,handle_length-hole_length])
	cylinder(r=8.5, h=hole_length+5);
}

module rounded_handle_body() {
	difference() {
		handle_body();
		rounded_end();
		bar_hole();
	}
}

module handle() {
	rounded_handle_body();
}

color("Chocolate")
handle();