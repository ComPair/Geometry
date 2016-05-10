///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

Include ACDLayer.geo 
//Include PassiveTrays.geo THIS IS TBD

//This builds the ACD Detector
Volume ACDDetector
ACDDetector.Material Vacuum
ACDDetector.Visibility 0
ACDDetector.Virtual true
ACDDetector.Shape BRIK 50.0 50.0 35.75
// Include this to run stand-alone
//ACDDetector.Mother 0

// Add the ACD Layers to the ACD Detector
ACDTop.Copy ACDTop_Det
ACDTop_Det.Position 0.0 0.0 35.0
ACDTop_Det.Mother ACDDetector

For I 2 -49.25 98.5
    For J 2 1 1
    	ACDSide.Copy ACDSide_Det_%I_%J	
    	ACDSide_Det_%I_1.Position {$I} 0.0 -0.75
    	ACDSide_Det_%I_2.Position 0.0 {$I} -0.75
    	ACDSide_Det_%I_1.Rotation 0.0 0.0 90.0
    	ACDSide_Det_%I_%J.Mother ACDDetector 	
    	//Print $I, $J
    Done
Done 




