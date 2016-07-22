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
topACDPanel.Visibility 0
topACDPanel.Color 6
topACDPanel.Shape BRIK 49.8  49.8  0.75
topACDPanel.Position 0. 0. 35.
topACDPanel.Mother ACDDetector

Volume sideACDPanel
sideACDPanel.Material Vacuum
sideACDPanel.Visibility 0
sideACDPanel.Color 6
sideACDPanel.Shape BRIK 50. 0.75 35.

// this is plastic scintillator
Volume sideACDPlastic
sideACDPlastic.Material PMTPlastic
sideACDPlastic.Visibility 0
sideACDPlastic.Color 4
sideACDPlastic.Shape BRIK 49.8 0.75 34.8
sideACDPlastic.Position 0. 0. 0.
sideACDPlastic.Mother sideACDPanel 


// building the sides of the detector
For I 2 -50.75 101.5
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

# WLS bar with SiPM for the Top panel
Volume topWLSpanel
topWLSpanel.Material Vacuum
topWLSpanel.Visibility 0
topWLSpanel.Color 3
topWLSpanel.Shape BRIK 48.5  0.1 0.75

For I 2 -49.9 99.8
    For J 2 1 1
        topWLSpanel.Copy topWLSpanel_%I_%J
        topWLSpanel_%I_1.Position {$I} 0.0 35.
        topWLSpanel_%I_2.Position 0.0 {$I} 35.
        topWLSpanel_%I_1.Rotation 0.0 0.0 90.0
        topWLSpanel_%I_%J.Mother ACDDetector
        //Print $I, %I, $J
    Done
Done


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

//building the support panels
For I 2 -49.25 98.5
    For J 2 1 1
    	sideSupportPanel.Copy sideSupportPanel_%I_%J	
    	sideSupportPanel_%I_1.Position {$I} 0.0 -1.5
    	sideSupportPanel_%I_2.Position 0.0 {$I} -1.5
    	sideSupportPanel_%I_1.Rotation 0.0 0.0 90.0
    	sideSupportPanel_%I_%J.Mother ACDDetector 	
    	//Print $I, %I, $J, %J
    Done
Done

 
