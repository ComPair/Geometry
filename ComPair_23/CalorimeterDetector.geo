//Build a single CsI log with log tube

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo

//Volume World
//World.Material Vacuum
//World.Visibility 0
//World.Color 0
//World.Shape BRIK 500. 500. 500.
//World.Mother 0

///////

// Single log 38.8cm x 1.5cm x 1.5 cm
Constant CsILogWidth 1.5
Constant CsILogLength 38.8


Volume CsILog
CsILog.Material CsI
CsILog.Visibility 1
CsILog.Color 7
CsILog.Shape BOX {CsILogWidth/2} {CsILogWidth/2} {CsILogLength/2}



