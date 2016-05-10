//Stacking 40 layers of Si, total dimensions 80cm x 80cm x 58.55cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include SiStripLayer.geo
Include PassiveRibs.geo

//This builds one tower of the SiStrip Detector
Volume SiStripTower
SiStripTower.Material Vacuum
SiStripTower.Visibility 0
SiStripTower.Shape BRIK 20.0 20.0 30.0
//SiStripTower.Mother 0

For I 40 -29.25 1.5  
    SiStripLayer.Copy SiStripLayer_%I
    SiStripLayer_%I.Position 0.0 0.0 $I
    SiStripLayer_%I.Mother SiStripTower

    PassiveFrame_Volume.Copy PassiveFrame_%I
    PassiveFrame_%I.Position 0.0 0.0 $I
    //Print %I $I   
    PassiveFrame_%I.Mother SiStripTower
Done 

//Adds the towers to build the detector
Volume SiStripDetector
SiStripDetector.Material Vacuum
SiStripDetector.Visibility 0
SiStripDetector.Shape BRIK 20.0 20.0 30.0
//SiStripDetector.Mother 0

SiStripTower.Mother SiStripDetector









