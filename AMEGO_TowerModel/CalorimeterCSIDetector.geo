//Stacking 6 layers of CSI, total dimensions 50cm x 50cm x 12 cm
// each layer is 1.5 cm with 0.5 cm spacing between layers

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCSILayer.geo 
#Include PassiveTrays.geo

//This builds one tower of the CsI Detector
Volume CSITower
CSITower.Material Vacuum
CSITower.Visibility 0
CSITower.Shape BRIK 25.0 25.0 6.0

// Add the CsI segment to the Hole in the passive tray
// If we remove the PassiveTray_Hole, add it to Block
#CSISegment.Copy CSISegment_Det
#CSISegment_Det.Position 0.0 0.0 0.25
#CSISegment_Det.Mother PassiveTray_Block 

//There are 6 calorimeter layers
For I 6 -5.25 2.0
    CSISegment.Copy CSISegment_%I
    CSISegment_%I.Position 0.0 0.0 {$I}
    CSISegment_1.Rotation 0.0 0.0 0.0
    CSISegment_2.Rotation 0.0 0.0 90.0   
    CSISegment_3.Rotation 0.0 0.0 0.0	 
    CSISegment_4.Rotation 0.0 0.0 90.0
    CSISegment_%I.Mother CSITower 
Done 

//Adds the towers to build the detector
Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 25.0 25.0 6.0
// Include this to run stand-alone
//CSIDetector.Mother 0

CSITower.Mother CSIDetector

