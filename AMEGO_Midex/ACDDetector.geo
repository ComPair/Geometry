/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo

//Volume World
//World.Material Vacuum
//World.Visibility 0
//World.Color 0
//World.Shape BRIK 500. 500. 500.
//World.Mother 0

///////


//This builds the ACD Detector totally made up numbers: 129.5cm x 129.5cm x 73cm
Volume ACDDetector
ACDDetector.Material Vacuum
ACDDetector.Visibility 0
ACDDetector.Color 9
ACDDetector.Shape BRIK 64.7 64.7 45.1
// Include this to run stand-alone
//ACDDetector.Mother World

// Active ACD Panels
Volume topACDPanel
topACDPanel.Material EJ200
topACDPanel.Visibility 1
topACDPanel.Color 7
topACDPanel.Shape BRIK 64.7 64.7 0.75
topACDPanel.Position 0. 0. {45.1-0.75}
topACDPanel.Mother ACDDetector


//The ACD in the CAD model doesn't cover the bottom of the tracker. So looking at the previous AMEGO-X simulation model I matched the distance, which covers the first layer of the calorimeter
Constant ExtraACDLength 5.3

Volume sideACDPanelShort
sideACDPanelShort.Material EJ200
sideACDPanelShort.Visibility 1
sideACDPanelShort.Color 7
sideACDPanelShort.Shape BRIK 0.75 60.2 {35.75 + ExtraACDLength}

sideACDPanelShort.Copy ACDPanelSideShort1
ACDPanelSideShort1.Position -60.2 0.0 {45.1 - 35.75 - 1.5 - ExtraACDLength}
ACDPanelSideShort1.Mother ACDDetector 

sideACDPanelShort.Copy ACDPanelSideShort2
ACDPanelSideShort2.Position 60.2 0.0 {45.1 - 35.75 - 1.5 - ExtraACDLength}
ACDPanelSideShort2.Mother ACDDetector

Volume sideACDPanelLong
sideACDPanelLong.Material EJ200
sideACDPanelLong.Visibility 1
sideACDPanelLong.Color 7
sideACDPanelLong.Shape BRIK 64.7 0.75 {35.75 + ExtraACDLength}

sideACDPanelLong.Copy ACDPanelSideLong1
ACDPanelSideLong1.Position 0. {-60.2-0.75} {45.1 - 35.75 - 1.5 - ExtraACDLength}
ACDPanelSideLong1.Mother ACDDetector

sideACDPanelLong.Copy ACDPanelSideLong2
ACDPanelSideLong2.Position 0. {60.2 + 0.75} {45.1 - 35.75 - 1.5 - ExtraACDLength}
ACDPanelSideLong2.Mother ACDDetector

//ACD Support
Volume ACDSupportTop
ACDSupportTop.Shape BOX 57.7 57.7 0.635
ACDSupportTop.Material Rohacell
ACDSupportTop.Visibility 1
ACDSupportTop.Position 0 0 {45.1 - 1.5 - 3.95 - 0.635}
ACDSupportTop.Mother ACDDetector

Volume ACDSupportSideShort
ACDSupportSideShort.Shape BOX 0.635 56.4 40.0
ACDSupportSideShort.Material Rohacell
ACDSupportSideShort.Visibility 1

ACDSupportSideShort.Copy ACDSupportSideShort1
ACDSupportSideShort1.Position {-57.7 + 0.635} 0 {45.1 - 1.5 - 3.95 - 1.27 - 40}
ACDSupportSideShort1.Mother ACDDetector

ACDSupportSideShort.Copy ACDSupportSideShort2
ACDSupportSideShort2.Position {57.7 - 0.635} 0 {45.1 - 1.5 - 3.95 - 1.27 - 40}
ACDSupportSideShort2.Mother ACDDetector


Volume ACDSupportSideLong
ACDSupportSideLong.Shape BOX 57.7 0.635 40.0
ACDSupportSideLong.Material Rohacell
ACDSupportSideLong.Visibility 1

ACDSupportSideLong.Copy ACDSupportSideLong1
ACDSupportSideLong1.Position 0 {-57.7 + 0.635} {45.1 - 1.5 - 3.95 - 1.27 - 40}
ACDSupportSideLong1.Mother ACDDetector

ACDSupportSideLong.Copy ACDSupportSideLong2
ACDSupportSideLong2.Position 0 {57.7 - 0.635} {45.1 - 1.5 - 3.95 - 1.27 - 40}
ACDSupportSideLong2.Mother ACDDetector
