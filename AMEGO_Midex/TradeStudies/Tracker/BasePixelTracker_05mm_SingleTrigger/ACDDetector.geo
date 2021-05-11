///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

//This builds the ACD Detector totally made up numbers: 125cm x 125cm x 70cm
//The top and side panels will be different detectors. 
Volume ACDDetector
ACDDetector.Material Vacuum
ACDDetector.Visibility 0
ACDDetector.Shape BRIK 52.5 52.5 0.75
// Include this to run stand-alone
//ACDDetector.Mother 0

Volume ACDSideDetector
ACDSideDetector.Material Vacuum
ACDSideDetector.Visibility 0
ACDSideDetector.Shape BRIK 52.5 0.75 35.
// Include this to run stand-alone
//ACDSideDetector.Mother 0

// Active ACD Panels Top and Sides
Volume topACDPanel
topACDPanel.Material PMTPlastic
topACDPanel.Visibility 1
topACDPanel.Color 3
topACDPanel.Shape BRIK 52.5 52.5 0.75
topACDPanel.Position 0. 0. 0.
topACDPanel.Mother ACDDetector

// this is plastic scintillator
Volume sideACDPanel
sideACDPanel.Material PMTPlastic
sideACDPanel.Visibility 1
sideACDPanel.Color 3
sideACDPanel.Shape BRIK 52.5 0.75 35.
sideACDPanel.Position 0. 0. 0.
sideACDPanel.Mother ACDSideDetector 




