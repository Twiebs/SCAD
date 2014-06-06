//Telescope lense adapter

telescopeDiameter = 36;
telescopeRadius = telescopeDiameter / 2;
telescopeLenseLength = 25;
camDiameter = 35;
camRadius = camDiameter / 2;
camLenseLength = 14;

wallThickness = 2;

//
adapter();


module adapter(){
cylinder(telescopeLenseLength, telescopeRadius + wallThickness, telescopeRadius + wallThickness);
}
