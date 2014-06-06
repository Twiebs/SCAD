//Parametric Vape accesories
//Created by Torin 'Twiebs' Wiebelt
//Licened udner Creative-commons-share-alike-Non-Commerical
//Copyright (c) Torin Wiebelt


//Generate geometery
vapeStand();

//Vape Configuration
vapeDiameter = 10;

//Stand Paramters
rimHeight = 2;
rimWidth = 2;
baseWidth = 30;
baseHeight = 25;
wallWidth = 2;
holderHeight = 15;
innerRimDiameter = 25;
innerRimWidth = 1;
innerRimHeight = 10;

//Calculated Parameters

module base(){
cylinder(rimHeight, baseWidth, baseWidth);
translate([0, 0, rimHeight]) cylinder(innerRimHeight, baseWidth - rimWidth, innerRimDiameter);
translate([0, 0, innerRimHeight]) cylinder(baseHeight - innerRimHeight, innerRimDiameter - innerRimWidth, vapeDiameter + wallWidth);
}

module vapeHolder(){
difference(){
cylinder(holderHeight, vapeDiameter + wallWidth, vapeDiameter + wallWidth);
//cutout
cylinder(holderHeight, vapeDiameter, vapeDiameter);
}
}

module vapeStand(){
base();
translate([0, 0, baseHeight]) vapeHolder();
}

