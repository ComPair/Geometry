//Stacking 4 layers of CSI, total dimensions 80cm x 80cm x 6.4 cm
// each layer is 1.5 cm with .1 cm spacing between layers

///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCSILayer.geo 
Include PassiveTrays.geo

//This builds one tower of the CsI Detector
Volume CSITower
CSITower.Material Vacuum
CSITower.Visibility 0
CSITower.Shape BRIK 20.0 20.0 5.0

// Add the CsI segment to the Hole in the passive tray
// If we remove the PassiveTray_Hole, add it to Block
CSISegment.Copy CSISegment_Det
CSISegment_Det.Position 0.0 0.0 0.25
CSISegment_Det.Mother PassiveTray_Block 
//CSISegment_Det.Position 0.0 0.0 0.0
//CSISegment_Det.Mother PassiveTray_Hole 

//There are 4 calorimeter layers
For I 4 -2.4 2.0
    PassiveTray_Volume.Copy PassiveTray_%I
    PassiveTray_%I.Position 0.0 0.0 {$I}
    PassiveTray_1.Rotation 0.0 0.0 0.0
    PassiveTray_2.Rotation 0.0 0.0 90.0   
    PassiveTray_3.Rotation 0.0 0.0 0.0	 
    PassiveTray_4.Rotation 0.0 0.0 90.0
    PassiveTray_%I.Mother CSITower 
Done 

//Adds the towers to build the detector
Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 20.0 20.0 5.0
// Include this to run stand-alone
//CSIDetector.Mother 0

CSITower.Mother CSIDetector

