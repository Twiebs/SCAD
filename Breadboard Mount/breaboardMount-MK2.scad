/**Breadboard Mount MK-2
*
*Created by Torin 'Twiebs' Wiebelt
*Licenced under Creative Commons Attribution-NonCommercial-ShareAlike 
*
*/

include <MCAD/boxes.scad>;
include <MCAD/regular_shapes.scad>;

//
//Creats and renders the breadboard mount.
//
breadboardMount();
//
//

//Variables
//Change these to the size of your breadboard.
//These values are what worked for me, you might have to play with them to get a nice fit.
breadboardWidth = 55.25;
breadboardLength = 83.25;
breadboardHeight = 8;

//Thickness of the wall or "corners" of the breadboard holder
wallThickness = 2; 

//Variables for the mounting holes
holeOffset = 10;
holeD = 5;
holeR = holeD / 2;

strutWidth = 12;
strutThickness = 2;
strutLength = sqrt(pow((breadboardWidth + wallThickness) / 2, 2) + pow((breadboardLength + wallThickness) / 2, 2)) + holeOffset;
strutAngle = atan2(breadboardLength, breadboardWidth);


//Creates a strut with middle cutout and mount holes.
module strut(){
	difference(){
		translate([strutLength / 2, 0, strutThickness / 2])roundedBox([strutLength, strutWidth, strutThickness], 5, true); //Creats the strut arm.

		translate([strutLength / 2, 0, 0])roundedBox([strutLength / 2, strutWidth / 3, strutThickness*2], (strutWidth / 3) / 2, true); //Removes material from the center.

	translate([(strutLength - holeOffset / 2) + holeR / 4, 0, 0]) cylinder(strutThickness, holeR, holeR);
		}
}

//Creates 4 struts and rotates them to the correct angles.
module struts(){
union(){
rotate([0, 0, strutAngle])strut();
rotate([0, 0, 180 - strutAngle])strut();
rotate([0, 0, -strutAngle])strut();
rotate([0, 0, 180 + strutAngle])strut();
}
}

//Creates a perimeter for the breadboard mount.  This is used to create the corners.
module wall(){
difference(){
	cube([breadboardWidth + wallThickness*2, breadboardLength + wallThickness*2, breadboardHeight]);
	translate([wallThickness, wallThickness, 0])cube([breadboardWidth, breadboardLength, breadboardHeight]);
	}
}


//Creats the corners for the breadboard mount.
module corners(){
intersection(){
	//Duplicates the struts and raises them to intersect with the the corners of the breadboard wall.
	translate([0, 0, strutThickness]) scale([1, 1, breadboardHeight / strutThickness]) struts();
	translate([ -(breadboardWidth + wallThickness*2) / 2, -(breadboardLength + wallThickness*2) / 2, strutThickness])wall();
	}
}

//Creats the frame or "base" that the breadboard corners sit on.
module frame(){
difference(){
	//Creates the center circle and the struts that emanate from it.
	union(){
		cylinder(strutThickness, strutWidth, strutWidth);
		struts();
	}
	//Removes the center of the circle.
	cylinder(strutThickness, strutWidth - 4, strutWidth - 4);
}
}
//Creates the breadboard mount by unifying the frame and the corners of the breadboard wall.
module breadboardMount(){
union(){
	frame();
	corners();
}
}
