//Stacking 40 layers of Si, total dimensions 100cm x 100cm x 58.55cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include SiStripLayer.geo
//Include SiStripProperties.det

Volume SiStripDetector
SiStripDetector.Material Vacuum
SiStripDetector.Visibility 0
SiStripDetector.Shape BRIK 50.0 50.0 29.275
//SiStripDetector.Mother 0

For I 40 -29.25 1.5  
SiStripLayer.Copy SiStripLayer_%I
SiStripLayer_%I.Position 0.0 0.0 $I
//Print %I $I
SiStripLayer_%I.Mother SiStripDetector
Done 























































































































