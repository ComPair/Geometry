///// Uncomment these lines to run standalone 
//SurroundingSphere 300.0 0.0 0.0 0.0 300.0
//Include ../materials/Materials.geo
/////

//#Include ACDLayer.geo  #(can implement this later?)
Include PassiveACDFrame.geo 

//This builds the ACD Detector
Volume ACDDetector
ACDDetector.Material Vacuum
ACDDetector.Visibility 0
ACDDetector.Virtual true
ACDDetector.Shape BRIK 50.0 50.0 35.75
// Include this to run stand-alone
//ACDDetector.Mother 0

// Active ACD Panels Top and Sides

Volume topACDPanel
topACDPanel.Material PMTPlastic
topACDPanel.Visibility 1
topACDPanel.Color 6
topACDPanel.Shape BRIK 50. 50. 0.75
topACDPanel.Position 0. 0. 35.
topACDPanel.Mother ACDDetector

Volume sideACDPanel
sideACDPanel.Material PMTPlastic
sideACDPanel.Visibility 1
sideACDPanel.Color 6
sideACDPanel.Shape BRIK 50. 0.75. 35.

For I 2 -49.25 98.5
    For J 2 1 1
    	sideACDPanel.Copy ACDSide_Det_%I_%J	
    	ACDSide_Det_%I_1.Position {$I} 0.0 -0.75
    	ACDSide_Det_%I_2.Position 0.0 {$I} -0.75
    	ACDSide_Det_%I_1.Rotation 0.0 0.0 90.0
    	ACDSide_Det_%I_%J.Mother ACDDetector 	
    	//Print $I, $J
    Done
Done


// Passive ACD Panels Top and Sides

Volume topSupportPanel
topSupportPanel.Material Vacuum
topSupportPanel.Visibility 0
topSupportPanel.Shape BRIK 48.5 48.5 0.74
topSupportPanel.Position 0. 0. 33.51
topSupportPanel.Mother ACDDetector

topCarbon.Copy topC1
topC1.Position 0. 0. 0.69
topC1.Mother topSupportPanel

topCarbon.Copy topC2
topC2.Position 0. 0. -0.69
topC2.Mother topSupportPanel

topRohacell.Copy topR
topR.Position 0. 0. 0.
topR.Mother topSupportPanel


Volume sideSupportPanel
sideSupportPanel.Material Vacuum
sideSupportPanel.Visibility 0
sideSupportPanel.Shape BRIK 48.5 0.75 34.25
#sideSupportPanel.Position 0.0 47.75 -1.5
#sideSupportPanel.Mother ACDDetector

sideRohacell.Copy sideR
sideR.Position 0. 0. 0.
sideR.Mother sideSupportPanel

sideCarbon.Copy sideC1
sideC1.Position 0. 0.69 0.
sideC1.Mother sideSupportPanel

sideCarbon.Copy sideC2
sideC2.Position 0. -0.69 0.
sideC2.Mother sideSupportPanel

For I 2 -47.75 95.5
    For J 2 1 1
    	sideSupportPanel.Copy sideSupportPanel_%I_%J	
    	sideSupportPanel_%I_1.Position {$I} 0.0 -1.5
    	sideSupportPanel_%I_2.Position 0.0 {$I} -1.5
    	sideSupportPanel_%I_1.Rotation 0.0 0.0 90.0
    	sideSupportPanel_%I_%J.Mother ACDDetector 	
    	//Print $I, %I, $J
    Done
Done

 