//Longboard LED Strips

LEDWidth = 10;
stripWidth = 20;
stripLength = 394;
stripHeight = 2;
segmentLength = stripLength / 3;
connectionLength = 10;

//Render
strip();

module centerSegment(){
	difference(){
		cube([stripWidth, segmentLength, stripHeight]);
		translate([0, 0, stripHeight / 2])cube([stripWidth, connectionLength, stripHeight / 2]);
	translate([0, segmentLength - connectionLength, stripHeight / 2])cube([stripWidth, connectionLength, stripHeight / 2]);
	}
}

module endSegment(){
	difference(){
		cube([stripWidth, segmentLength, stripHeight]);
		translate([0, 0, stripHeight / 2])cube([stripWidth, connectionLength, stripHeight / 2]);
	}
}

module strip(){
	endSegment();
	translate([stripWidth * 2, 0, 0])centerSegment();
	translate([stripWidth * 4, 0, 0])endSegment();
}

