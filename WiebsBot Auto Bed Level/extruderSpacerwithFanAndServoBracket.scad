//Spacer const vars
eSpacerH = 12;
eSpacerW = 78;
eSpacerL = 10;

eSpacerHoleOff = 6;
eSpacerHoleDistance = 46.5;



holeOffset = 10;
holeDist = 20;

//
//Servo Mout vars
////////////////////////////
servoW = 23.25;
servoL = 13;
servoH = 16;

servoMountW = 38;
servoMountL = 25;
servoMountH = 6;

servoBaseW = 38;
servoBaseL= 38;
servoBaseH = 10;

wireSlotW = 2;
wireSlotL = 4;

servoBracketH = servoMountH + servoBaseH;
///////////////////////

//
//Fan Mount vars
//Hardware vars
holeD = 3.2;
holeR = holeD / 2;
nutSlotW = 3;
nutSlotL = 6.5;
nutSlotH = (eSpacerH / 2) + (holeD / 2);


//Geometry
//Create Mounting holes
//Extruder Spacer
module eSpacer(){
	difference(){
		cube([eSpacerW, eSpacerL, eSpacerH]);
		rotate([90, 0, 0])translate([eSpacerHoleOff, eSpacerH /2, -eSpacerL]) cylinder(eSpacerW + 1,holeD / 2, holeD /2);
		rotate([90, 0, 0])translate([eSpacerHoleOff + eSpacerHoleDistance - holeD, eSpacerL /2, -eSpacerL]) cylinder(eSpacerW + 1, holeD /2, holeD /2);
}
}


module moutingBracket(){
	difference(){
		//base
		translate([-eSpacerL, -servoBaseL, 0])cube([eSpacerL, servoBaseL + eSpacerL, eSpacerH]);
		//mountHoles
		translate([-eSpacerL - 0.5, -holeOffset, eSpacerH / 2]) rotate([0, 90, 0]) cylinder(eSpacerL + 1, holeD / 2, holeD / 2);
		translate([-eSpacerL - 0.5, -holeOffset - holeDist, (eSpacerH / 2)]) rotate([0, 90, 0]) cylinder(eSpacerL + 1, holeD / 2, holeD / 2);
		//nut slots
		translate([-eSpacerL / 2 - (nutSlotW / 2), (-nutSlotL / 2) -holeOffset, (eSpacerH / 2) - holeD]) cube([nutSlotW, nutSlotL, nutSlotH + holeD]);
		translate([-eSpacerL / 2 - (nutSlotW / 2), (-nutSlotL / 2) -holeOffset - holeDist, (eSpacerH / 2) - holeD]) cube([nutSlotW, nutSlotL, nutSlotH + holeD]);
}
}

module moutingBracketRight(){
	difference(){
		//base
		translate([-eSpacerL, -servoBaseL, 0])cube([eSpacerL, servoBaseL + eSpacerL, eSpacerH]);
		//mountHoles
		translate([-eSpacerL - 0.5, (-holeOffset / 1.5), eSpacerH / 2]) rotate([0, 90, 0]) cylinder(eSpacerL + 1, holeD / 2, holeD / 2);
		translate([-eSpacerL - 0.5, (-holeOffset / 1.5) - holeDist - 4, eSpacerH / 2]) rotate([0, 90, 0]) cylinder(eSpacerL + 1, holeD / 2, holeD / 2);
		//nut slots
		translate([-eSpacerL / 2 - (nutSlotW / 2), (-nutSlotL / 2) - (holeOffset/1.5), (eSpacerH / 2) - holeD]) cube([nutSlotW, nutSlotL, nutSlotH + holeD]);
		translate([-eSpacerL / 2 - (nutSlotW / 2), (-nutSlotL / 2) - (holeOffset / 1.5) - (holeDist + 4), (eSpacerH / 2) - holeD]) cube([nutSlotW, nutSlotL, nutSlotH + holeD]);
}
}

module servoMount(){
	difference(){
	//Base
	
	cube([servoMountW*2, servoMountL, servoMountH]);

	translate([0, 0, servoMountH - 12])cube([12, servoMountL, 12]);

	translate([servoMountW - 0.5, holeOffset, servoMountH - (servoMountW / 2) ]) rotate([0, 90, 0]) cylinder(servoMountW + 1, holeD /2, holeD/2);
	translate([servoMountW - 0.5, holeOffset + holeDist, servoMountH - (servoMountW / 2) ]) rotate([0, 90, 0]) cylinder(servoMountW + 1, holeD /2, holeD/2);
translate([0, (servoMountL / 2) - (servoW / 2), (servoMountH - servoMountW) / 2 - (servoH / 2) ])cube([servoW + 1, servoW, servoH]);

//Wire slot
	translate([0, 6, (servoMountL - 12) / 2 - 2])cube([servoMountH, 2, 4]);
}
}

module servoBracket(){
	//Base
difference(){
union(){
	difference(){
	//Base Cube
	cube([servoBaseW, servoBaseL, servoBaseH]);
	//Mounting Holes
	translate([holeOffset, servoBaseL - ((12 / 2)), 0]) cylinder(servoBaseH, holeR, holeR);
	translate([holeOffset + holeDist, servoBaseL - ((12 / 2)), 0]) cylinder(servoBaseH, holeR, holeR);
	}
	//servoMountBase
	translate([0, 0, servoBaseH])cube([servoMountW, servoMountL, servoMountH]);
}
	//servoMount Hole
	translate([(servoMountW / 2) - (servoW / 2), (servoMountL / 2) - (servoL / 2), 0])cube([servoW, servoL, (servoMountH + servoBaseH)]);
	//Wire Slot
	translate([(servoBaseW / 2) + (servoMountW / 4) + wireSlotW, servoMountL / 2 - wireSlotL / 2, 0])cube([wireSlotW, wireSlotL, servoBracketH]);

}
}


eSpacer();
moutingBracket();
translate([eSpacerW + eSpacerL, 0, 0])moutingBracketRight();
//servoMount();
//servoBracket();





