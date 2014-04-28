
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

module grip_cylinder() {
	translate([-20, -49, handle_length - 36])
	rotate([0,90,0])
	cylinder(r=38, h=40, $fn=200);
}

module grip_cylinders() {
	for (angle = [0:7]) {
		rotate([0,0,angle*45]) grip_cylinder();
	}
}

module bolt_hole() {
	translate([0,0,handle_length-71])
	rotate([0,90,0])
	cylinder(r=3, h=20);
}

module bolt_head() {
	translate([14,0,handle_length-71])
	rotate([0,90,0])
	cylinder(r=5, h=4);
}

module thumb_hole() {
	translate([0,-48,handle_length-25])
	sphere(r=38, $fn=200);
}

module handle() {
	difference() {
		handle_body();
		rounded_end();
		bar_hole();
		grip_cylinders();
		thumb_hole();
		bolt_hole();
		bolt_head();
	}
}

color("Chocolate") handle();
