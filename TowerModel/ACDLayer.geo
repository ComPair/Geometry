//Build 2 volumes of ACD: top and side

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

// Top layer is 100x100x1.5 cm 
Volume ACDTop
ACDTop.Material CsI
ACDTop.Visibility 1
ACDTop.Color 6
ACDTop.Shape BOX 50. 50. 0.75

// Top layer is 100x1.5x70 cm 
Volume ACDSide
ACDSide.Material PMTPlastic
ACDSide.Visibility 1
ACDSide.Color 6
ACDSide.Shape BOX 50. 0.75 35.

