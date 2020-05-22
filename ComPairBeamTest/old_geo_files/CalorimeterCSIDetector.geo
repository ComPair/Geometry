//Stacking 6 layers of CSI, total dimensions 50cm x 50cm x 12 cm
// each layer is 1.5 cm with .1 cm spacing between layers

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCSILayer.geo 

//This builds one tower of the CsI Detector
Volume CSITower
CSITower.Material Vacuum
CSITower.Visibility 0
CSITower.Shape BRIK 20. 20. 6.5

//Adds the towers to build the detector
Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 20. 20. 6.5
// Include this to run stand-alone
//CSIDetector.Mother 0

CSITower.Mother CSIDetector

