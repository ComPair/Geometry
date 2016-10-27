//Stacking 4 layers of CZT, total dimensions 120cm x 120cm x 7.45cm
//The side CZT are 115cm x 5cm x 20cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCZTLayer.geo 
Include CalorimeterCZTProperties.det

Volume CZTTower
CZTTower.Material Vacuum
CZTTower.Visibility 1
CZTTower.Shape BRIK 30.0 30.0 7.5
// NEEDS THIS LINE TO VIEW ALONE:
//CZTTower.Mother 0

Volume CZTSideTower
CZTSideTower.Material Vacuum
CZTSideTower.Visibility 0
CZTSideTower.Shape BRIK 57.5 2.5  10.0
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSideTower.Mother 0

// Builds 4 layers of the tower
For I 10 -6.25 1.5
	CZTLayer.Copy CZTLayer_%I
	CZTLayer_%I.Position 0.0 0.0 $I
	//Print %I $I
	CZTLayer_%I.Mother CZTTower
Done 

For I 4 -2.25 1.5
	CZTSideLayer.Copy CZTSideLayer_%I
	CZTSideLayer_%I.Position 0.0 $I 0.0
	CZTSideLayer_%I.Mother CZTSideTower
Done

//Adds the towers to build the detector
Volume CZTDetector
CZTDetector.Material Vacuum
CZTDetector.Visibility 1
CZTDetector.Shape BRIK 30.0 30.0 7.5
//CZTDetector.Mother 0

CZTTower.Mother CZTDetector

//Adds the side towers to build the detector
Volume CZTSideDetector
CZTSideDetector.Material Vacuum
CZTSideDetector.Visibility 0
CZTSideDetector.Shape BRIK 57.5 2.5  10.0
//CZTSideDetector.Mother 0

CZTSideTower.Mother CZTSideDetector

