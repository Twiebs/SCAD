phoneWidth = 72;
phoneThickness = 12.5;
phoneHeight = 100;
lampBaseThickness = 3;
lampBaseRadius = 30;


dockBaseHeight = 7;
dockBaseWidth = 90;
dockBaseLength = 50;
dockWallThickness = 4;
dockAngle = 15;
dockWidth = phoneWidth + dockWallThickness*2;
dockLength = phoneThickness + dockWallThickness * 2;
dockHeight = phoneHeight + dockWallThickness*2;
dockViewportHeight = 5;

LampDock();


module dock(){
	difference(){
		translate([(dockBaseWidth - dockWidth) / 2, dockBaseLength / 2 - dockLength / 2, dockBaseHeight])cube([dockWidth, dockLength, phoneHeight]);
		translate([(dockBaseWidth - dockWidth) / 2 + dockWallThickness, dockBaseLength / 2 - dockLength / 2, dockBaseHeight]) cube([phoneWidth, phoneThickness, dockHeight]);
}
}

module dockBase(){
cube([dockBaseWidth, dockBaseLength, dockBaseHeight]);

}

module lampBase(){
	cylinder(lampBaseThickness, lampBaseRadius, lampBaseRadius);
}


module LampDock(){
	rotate([-dockAngle, , ]) dockBase();
	rotate([-dockAngle, , ]) dock();
}