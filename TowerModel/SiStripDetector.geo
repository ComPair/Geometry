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

Volume SiStripDetector
SiStripDetector.Material Vacuum
SiStripDetector.Visibility 0
SiStripDetector.Shape BRIK 40.0 40.0 30.0

For I 2 -20.0 40.0
    For J 2 -20.0 40.0
    	SiStripTower.Copy SiStripTower_%I_%J
	SiStripTower_%I_%J.Position $I $J 0.0
	SiStripTower_1_1.Rotation 0.0 0.0 180.0
	SiStripTower_1_2.Rotation 0.0 0.0 90.0   
	SiStripTower_2_1.Rotation 0.0 0.0 270.0
	SiStripTower_2_2.Rotation 0.0 0.0 0.0
	SiStripTower_%I_%J.Mother SiStripDetector 
    Done
Done






































































































