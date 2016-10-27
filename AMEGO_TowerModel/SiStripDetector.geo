//Stacking 50 layers of Si, total dimensions 100cm x 100cm x 75cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

Include SiStripLayer.geo

//This builds one tower of the SiStrip Detector
Volume SiStripTower
SiStripTower.Material Vacuum
SiStripTower.Visibility 0
SiStripTower.Shape BRIK 25.0 25.0 30.5
// NEEDS THIS LINE TO VIEW ALONE:
//SiStripTower.Mother 0

SiStripLayer.Position 0. 0. 0.
#SiStripLayer.Mother PassiveFrame_Hole_1

For I 60 -29.5 1.0
    SiStripLayer.Copy SiStripLayer_%I
    SiStripLayer_%I.Position 0.0 0.0 $I
    //Print %I $I   
    SiStripLayer_%I.Mother SiStripTower
Done 

//Adds the towers to build the detector
Volume SiStripDetector
SiStripDetector.Material Vacuum
SiStripDetector.Visibility 0
SiStripDetector.Shape BRIK 25.0 25.0 30.5
//SiStripDetector.Mother 0

SiStripTower.Mother SiStripDetector









