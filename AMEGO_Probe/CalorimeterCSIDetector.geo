//Stacking 6 layers of CSI, total dimensions 50cm x 50cm x 12 cm
// each layer is 1.5 cm with .1 cm spacing between layers

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

Include ../Detectors/CalorimeterCSILayer.geo 
Include ../Detectors/PassiveTrays.geo

//This builds one tower of the CsI Detector
Volume CSITower
CSITower.Material Vacuum
CSITower.Visibility 0
CSITower.Shape BRIK 20. 20. 6.5

// Add the CsI segment to the Hole in the passive tray
// If we remove the PassiveTray_Hole, add it to Block
// The CSISegments (layer of 26 bars each) are defined with the z-dimension as the long dimension so that position resolution can be measured along the length of the bar, therefore we need to rotate them here.
CSISegment.Copy CSISegment_Det
CSISegment_Det.Position 0.0 0.0 0.25
CSISegment_Det.Rotation 0 90 0
CSISegment_Det.Mother PassiveTray_Block 
//CSISegment_Det.Position 0.0 0.0 0.0
//CSISegment_Det.Mother PassiveTray_Hole 

//There are 6 calorimeter layers
For I 6 -5.25 2.0
    PassiveTray_Volume.Copy PassiveTray_%I
    PassiveTray_%I.Position 0.0 0.0 {$I}
    PassiveTray_2.Rotation 0.0 0.0 90.0
    PassiveTray_4.Rotation 0.0 0.0 90.0   
    PassiveTray_6.Rotation 0.0 0.0 90.0	 
    PassiveTray_%I.Mother CSITower 
Done 

//Adds the towers to build the detector
Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 20. 20. 6.5
// Include this to run stand-alone
//CSIDetector.Mother 0

CSITower.Mother CSIDetector

