//Stacking 4 layers of CSI, total dimensions 100cm x 100cm x 12.6 cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCSILayer.geo 
Include CalorimeterCSIProperties.det

Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 50.0 50.0 6.6
//CSIDetector.Mother 0

For I 4 -6.0 4  
CSILayer.Copy CSILayer_%I
CSILayer_%I.Position 0.0 0.0 $I
//Print %I $I
CSILayer_%I.Mother CSIDetector
Done 
