//Stacking 4 layers of CSI, total dimensions 80cm x 80cm x 6.4 cm
// each layer is 1.5 cm with .1 cm spacing between layers

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCSILayer.geo 
Include CalorimeterCSIProperties.det

Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 40.0 40.0 3.2
//CSIDetector.Mother 0

For I 4 -2.4 1.6  
CSILayer.Copy CSILayer_%I
CSILayer_%I.Position 0.0 0.0 $I
//Print %I $I
CSILayer_%I.Mother CSIDetector
Done 
