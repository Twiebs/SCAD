breadboardWidth = 54;
breadboardLength = 83;
breadboardHeight = 8;
breadboardBrim = 10;

wallThickness =2;
sledThickness = 3;
sledBrim = 6;

holeDiameter = 5;
holeRadius = 2.5;

Width = breadboardWidth + wallThickness*2 + sledBrim*2;
Length = breadboardLength + wallThickness*2 + sledBrim*2;

module breadboardHolder(){
difference(){
cube([breadboardWidth + wallThickness*2, breadboardLength + wallThickness*2, breadboardHeight]);
translate([wallThickness, wallThickness, 0]) cube([breadboardWidth, breadboardLength, breadboardHeight]);
}
}

module mountHoles(){
translate([sledBrim / 2 + (holeRadius / 6), sledBrim / 2 + (holeRadius / 6), 0]) cylinder(sledThickness + 1, holeRadius, holeRadius);
translate([Width - sledBrim / 2 - (holeRadius / 6), sledBrim / 2 + (holeRadius / 6), 0]) cylinder(sledThickness + 1, holeRadius, holeRadius);
translate([sledBrim / 2 + (holeRadius / 6), Length - sledBrim / 2 - (holeRadius / 6), 0]) cylinder(sledThickness + 1, holeRadius, holeRadius);
translate([Width - sledBrim / 2 - (holeRadius / 6), Length - sledBrim / 2 - (holeRadius / 6), 0]) cylinder(sledThickness + 1, holeRadius, holeRadius);
}

module cutout(){
	translate([(Width / 2) - ((breadboardWidth -(breadboardBrim*2)) / 2) , (Length / 2) - (breadboardLength - (breadboardBrim*2)) / 2, 0])
	cube([breadboardWidth -(breadboardBrim*2), breadboardLength - (breadboardBrim*2), sledThickness + 1]);
}

module sled(){
difference(){
cube([breadboardWidth + wallThickness*2 + sledBrim*2, breadboardLength + wallThickness*2 + sledBrim*2, sledThickness]);
mountHoles();

}
}

module breadboardMount(){
difference(){
union(){
sled();
translate([sledBrim , sledBrim , sledThickness])breadboardHolder();
}
cutout();
}
}

breadboardMount();

