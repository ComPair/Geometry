//CZT Detectors confugured in logs 

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo
///////

Include ../Detectors/PassiveCZTFrame.geo

// Build a single CZT bar: 0.8x0.8x4 cm
Volume CZTBar
CZTBar.Visibility 0
CZTBar.Color 1
CZTBar.Material CZT
CZTBar.Shape BRIK 0.4 0.4 2.0

//Create the single segment of CZT, 5cmx5cmx4.2cm
Volume CZTSegment
CZTSegment.Visibility 1
CZTSegment.Color 1
CZTSegment.Material Vacuum
CZTSegment.Shape BRIK 2.5 2.5 2.1
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSegment.Mother 0

// Cut a hole in the Passive Frame for the CZT Bars
Volume CZTBlock
CZTBlock.Visibility 1
CZTBlock.Color 1
CZTBlock.Material Vacuum
CZTBlock.Shape BRIK 2.4 2.4 2.0
CZTBlock.Mother PassiveCZTFrame_Block


// Put the CZT bars into the segment
For I 6 -2. 0.8
    For J 6 -2. 0.8
    	CZTBar.Copy CZTBar_%I_%J
    	CZTBar_%I_%J.Position $I $J 0.0
    	CZTBar_%I_%J.Mother CZTBlock
    Done
Done

PassiveCZTFrame_Volume.Position 0. 0. 0.
PassiveCZTFrame_Volume.Mother CZTSegment






Build a single CZT side bar: 0.8x0.8x4 cm
Volume CZTSideBar
CZTSideBar.Visibility 0
CZTSideBar.Color 1
CZTSideBar.Material CZT
CZTSideBar.Shape BRIK 0.4 0.4 2.0

//Building single segment of side CZT, 5cmx5cmx4.2cm
Volume CZTSideSegment
CZTSideSegment.Visibility 1
CZTSideSegment.Color 1
CZTSideSegment.Material Vacuum
CZTSideSegment.Shape BRIK 2.5 2.5 2.1
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSideSegment.Mother 0

// Cut a hole in the Passive Frame for the CZT Bars
Volume CZTSideBlock
CZTSideBlock.Visibility 1
CZTSideBlock.Color 1
CZTSideBlock.Material Vacuum
CZTSideBlock.Shape BRIK 2.4 2.4 2.0
CZTSideBlock.Position 0. 0. 0.1
CZTSideBlock.Mother PassiveCZTSideFrame_Block

// Put the CZT bars into the segment
For I 6 -2. 0.8
    For J 6 -2. 0.8
    	CZTSideBar.Copy CZTSideBar_%I_%J
    	CZTSideBar_%I_%J.Position $I $J 0.0
    	CZTSideBar_%I_%J.Mother CZTSideBlock
    Done
Done

PassiveCZTSideFrame_Volume.Position 0. 0. 0.
PassiveCZTSideFrame_Volume.Mother CZTSideSegment




