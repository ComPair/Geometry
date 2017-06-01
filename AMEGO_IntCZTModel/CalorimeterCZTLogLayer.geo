//CZT Detectors confugured in logs 

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

Include PassiveCZTFrame.geo

// Build a single CZT bar: 0.8x0.8x4 cm
Volume CZTBar
CZTBar.Visibility 1
CZTBar.Color 1
CZTBar.Material CZT
CZTBar.Shape BRIK 0.4 0.4 2.0

// Create a block of CZT to add to the passive frame
Volume CZTBlock
CZTBlock.Visibility 1
CZTBlock.Color 1
CZTBlock.Material Vacuum
CZTBlock.Shape BRIK 2.4 2.4 2.0
CZTBlock.Mother PassiveCZTFrame_Block

//Create the single segment of CZT, 5cmx5cmx4.2cm
Volume CZTSegment
CZTSegment.Visibility 1
CZTSegment.Color 1
CZTSegment.Material Vacuum
CZTSegment.Shape BRIK 2.5 2.5 2.1
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSegment.Mother 0

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

//Build a single CZT side bar: 0.6x0.6x4 cm
Volume CZTSideBarOne
CZTSideBarOne.Visibility 1
CZTSideBarOne.Color 1
CZTSideBarOne.Material CZT
CZTSideBarOne.Shape BRIK 0.3 2.0 0.3

//Building single segment of side CZT, 39cmx4.5cmx1.cm
Volume CZTSideSegmentOne
CZTSideSegmentOne.Visibility 1
CZTSideSegmentOne.Color 1
CZTSideSegmentOne.Material Vacuum
CZTSideSegmentOne.Shape BRIK 19.5 2.25 0.4
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSideSegmentOne.Mother 0

// Put the CZT bars into the segment
For I 48 -19.1 0.8125
    CZTSideBarOne.Copy CZTSideBarOne_%I
    CZTSideBarOne_%I.Position $I 0.0 0.0
    CZTSideBarOne_%I.Mother PassiveCZTSideFrameOne_Block
Done

PassiveCZTSideFrameOne_Volume.Position 0. 0. 0.
PassiveCZTSideFrameOne_Volume.Mother CZTSideSegmentOne

//Build a single CZT side bar: 0.6x0.6x4 cm
Volume CZTSideBarTwo
CZTSideBarTwo.Visibility 1
CZTSideBarTwo.Color 1
CZTSideBarTwo.Material CZT
CZTSideBarTwo.Shape BRIK 0.3 2.0 0.3

//Building another segment of side CZT, 39cmx4.5cmx1.cm
Volume CZTSideSegmentTwo
CZTSideSegmentTwo.Visibility 1
CZTSideSegmentTwo.Color 1
CZTSideSegmentTwo.Material Vacuum
CZTSideSegmentTwo.Shape BRIK 19.5 2.25 0.4
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSideSegmentTwo.Mother 0

// Put the CZT bars into the segment
For I 48 -19.1 0.8125
    CZTSideBarTwo.Copy CZTSideBarTwo_%I
    CZTSideBarTwo_%I.Position $I 0.0 0.0
    CZTSideBarTwo_%I.Mother PassiveCZTSideFrameTwo_Block
Done

PassiveCZTSideFrameTwo_Volume.Position 0. 0. 0.
PassiveCZTSideFrameTwo_Volume.Mother CZTSideSegmentTwo




