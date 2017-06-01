// Setup file for the ComPair prototype

// Include section
// NEEDS THIS LINE TO VIEW ALONE:
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
////////

//this assumes that the outter shell of the frame is 5.x5.x4 cm
//the logs take up 4.8x4.8x4 cm

// The Mother Volume of the Detector Configuration:
Volume PassiveCZTFrame_Volume
PassiveCZTFrame_Volume.Material Vacuum
PassiveCZTFrame_Volume.Visibility 0
PassiveCZTFrame_Volume.Shape BOX 2.5. 2.5 2.1
// NEEDS THIS LINE TO VIEW ALONE:
//PassiveCZTFrame_Volume.Mother 0

// One big block from which parts are cut away later -- should be Peek
Volume PassiveCZTFrame_Block
PassiveCZTFrame_Block.Material Peek
PassiveCZTFrame_Block.Shape BOX 2.5 2.5 2.1
PassiveCZTFrame_Block.Position 0. 0. 0.
PassiveCZTFrame_Block.Color 1
PassiveCZTFrame_Block.Visibility 1
PassiveCZTFrame_Block.Mother PassiveCZTFrame_Volume

// The Mother Volume of the Detector Configuration:
// This is an alternative model that is going to fit inside the tracker
Volume PassiveCZTSideFrameOne_Volume
PassiveCZTSideFrameOne_Volume.Material Vacuum
PassiveCZTSideFrameOne_Volume.Visibility 0
PassiveCZTSideFrameOne_Volume.Shape BOX 19.5 2.25 0.4
// NEEDS THIS LINE TO VIEW ALONE:
//PassiveCZTSideFrameOne_Volume.Mother 0

// One big block from which parts are cut away later -- should be Peek
Volume PassiveCZTSideFrameOne_Block
PassiveCZTSideFrameOne_Block.Material Peek
PassiveCZTSideFrameOne_Block.Shape BOX 19.5 2.25 0.4
PassiveCZTSideFrameOne_Block.Position 0. 0. 0.
PassiveCZTSideFrameOne_Block.Color 1
PassiveCZTSideFrameOne_Block.Visibility 1
PassiveCZTSideFrameOne_Block.Mother PassiveCZTSideFrameOne_Volume


// The Mother Volume of the Detector Configuration:
// This is an alternative model that is going to fit inside the tracker
Volume PassiveCZTSideFrameTwo_Volume
PassiveCZTSideFrameTwo_Volume.Material Vacuum
PassiveCZTSideFrameTwo_Volume.Visibility 0
PassiveCZTSideFrameTwo_Volume.Shape BOX 19.5 2.25 0.4
// NEEDS THIS LINE TO VIEW ALONE:
//PassiveCZTSideFrameTwo_Volume.Mother 0

// One big block from which parts are cut away later -- should be Peek
Volume PassiveCZTSideFrameTwo_Block
PassiveCZTSideFrameTwo_Block.Material Peek
PassiveCZTSideFrameTwo_Block.Shape BOX 19.5 2.25 0.4
PassiveCZTSideFrameTwo_Block.Position 0. 0. 0.
PassiveCZTSideFrameTwo_Block.Color 1
PassiveCZTSideFrameTwo_Block.Visibility 1
PassiveCZTSideFrameTwo_Block.Mother PassiveCZTSideFrameTwo_Volume


