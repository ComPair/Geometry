//Stacking 4 layers of CZT, total dimensions 100cm x 100cm x 7.45cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCZTLayer.geo 
Include CalorimeterCZTProperties.det

Volume CZTTower
CZTTower.Material Vacuum
CZTTower.Visibility 0
CZTTower.Shape BRIK 25.0 25.0 3.725
// NEEDS THIS LINE TO VIEW ALONE:
//CZTTower.Mother 0

// Builds 4 layers of the tower
For I 4 -3.225 2.15  
	CZTLayer.Copy CZTLayer_%I
	CZTLayer_%I.Position 0.0 0.0 $I
	//Print %I $I
	CZTLayer_%I.Mother CZTTower
Done 

//Adds the towers to build the detector
Volume CZTDetector
CZTDetector.Material Vacuum
CZTDetector.Visibility 0
CZTDetector.Shape BRIK 25.0 25.0 3.725
//CZTDetector.Mother 0

CZTTower.Mother CZTDetector

