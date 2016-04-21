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
CSITower.Virtual true
CSITower.Shape BRIK 20.0 20.0 10.0

Constant offset 0.25

For I 4 -2.4 2.0  
    CSISegment.Copy CSISegment_%I
    CSISegment_%I.Position 0.0 0.0 {$I+offset}
    CSISegment_1.Rotation 0.0 0.0 0.0
    CSISegment_2.Rotation 0.0 0.0 90.0   
    CSISegment_3.Rotation 0.0 0.0 0.0	 
    CSISegment_4.Rotation 0.0 0.0 90.0
    CSISegment_%I.Mother CSITower

    PassiveTray_Volume.Copy PassiveTray_%I
    PassiveTray_%I.Position 0.0 0.0 {$I}
    PassiveTray_1.Rotation 0.0 0.0 0.0
    PassiveTray_2.Rotation 0.0 0.0 90.0   
    PassiveTray_3.Rotation 0.0 0.0 0.0	 
    PassiveTray_4.Rotation 0.0 0.0 90.0
    //Print %I $I {$I-offset}  
    PassiveTray_%I.Mother CSITower 
Done 

//Adds the towers to build the detector
Volume CSIDetector
CSIDetector.Material Vacuum
CSIDetector.Visibility 0
CSIDetector.Shape BRIK 40.0 40.0 10.2
//CSIDetector.Mother 0

For I 2 -20.0 40.0
    For J 2 -20.0 40.0
    	CSITower.Copy CSITower_%I_%J
    	CSITower_%I_%J.Position $I $J 0.0
    	CSITower_%I_%J.Mother CSIDetector
    Done
Done
