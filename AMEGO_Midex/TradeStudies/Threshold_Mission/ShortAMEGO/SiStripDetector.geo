//Stacking 40 layers of Si, total dimensions 80cm x 80cm x 58.55cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

Include SiStripLayer.geo
Include PassiveRibs.geo

//This builds one tower of the SiStrip Detector
Volume SiStripTower
SiStripTower.Material Vacuum
SiStripTower.Visibility 0
SiStripTower.Shape BRIK 22.5 22.5 23.0
// NEEDS THIS LINE TO VIEW ALONE:
//SiStripTower.Mother 0

SiStripLayer.Position 0. 0. 0.
SiStripLayer.Mother PassiveFrame_Hole_1

For I 30 -22.0 1.5
    PassiveFrame_Volume.Copy PassiveFrame_%I
    PassiveFrame_%I.Position 0.0 0.0 $I
    //Print %I $I   
    PassiveFrame_%I.Mother SiStripTower
Done 


//Adds the towers to build the detector
Volume SiStripDetector
SiStripDetector.Material Vacuum
SiStripDetector.Visibility 0
SiStripDetector.Shape BRIK 22.5 22.5 23.0
//SiStripDetector.Mother 0

SiStripTower.Mother SiStripDetector









