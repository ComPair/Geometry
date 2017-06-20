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
Volume PassiveCZTSideFrame_Volume
PassiveCZTSideFrame_Volume.Material Vacuum
PassiveCZTSideFrame_Volume.Visibility 0
PassiveCZTSideFrame_Volume.Shape BOX 19.5 2.25 0.3
// NEEDS THIS LINE TO VIEW ALONE:
//PassiveCZTSideFrame_Volume.Mother 0

// One big block from which parts are cut away later -- should be Peek
Volume PassiveCZTSideFrame_Block
PassiveCZTSideFrame_Block.Material Peek
PassiveCZTSideFrame_Block.Shape BOX 19.5 2.25 0.3
PassiveCZTSideFrame_Block.Position 0. 0. 0.
PassiveCZTSideFrame_Block.Color 1
PassiveCZTSideFrame_Block.Visibility 1
PassiveCZTSideFrame_Block.Mother PassiveCZTSideFrame_Volume

