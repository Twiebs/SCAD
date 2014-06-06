enclosureL = 25;
enclosureW = 30;
enclosureH = 35;
wallWidth = 2;

holeD = 18;


module enclosure(){
difference(){
cube([enclosureL, enclosureW, enclosureH]);
translate([wallWidth, wallWidth, wallWidth])cube([enclosureL - wallWidth*2, enclosureW - wallWidth*2 + 2, enclosureH - wallWidth*2]);
translate([enclosureL / 2, wallWidth + 1, enclosureH /2]) rotate([90, 0, 0])  cylinder(wallWidth + 2, holeD*.5, holeD*.5);
}
}

rotate([90, 0, 0])enclosure();
