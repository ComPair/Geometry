//CZT Detectors (currently) modeled as 2x2 monolithic segments which comprise 1 layer, 4 layers total for the detector

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

//Here is where you change individual properties of CZT wafers, if you wanted to....
//Volume CZTWafer
//CZTWafer.Material CZT
//CZTWafer.Shape BRIK ?? ?? ??
//CZTWafer.Mother CZTSegment

//Building single segment of CZT, 60cm x 60cm x 0.5cm 
Volume CZTSegment
CZTSegment.Visibility 1
CZTSegment.Color 1
CZTSegment.Material CZT
CZTSegment.Shape BRIK 30.0 30.0 0.5
CZTSegment.Mother CZTLayer

//Building single layer of 1 segment, 60cm x 60cm x 0.5cm
Volume CZTLayer
CZTLayer.Material Vacuum
CZTLayer.Visibility 0
CZTLayer.Shape BRIK 30.0 30.0 0.5
// Include this to run in stand-alone
//CZTLayer.Mother 0

//You can write a loop like this if you want to place wafers into a segment....
//For I  ? ? ?
//For J  ? ? ?
//CZTWafer.Copy Wafer_%I_%J
//CZTWafer_%I_%J.Position $I $J 0.0
//CZTWafer_%I_%J.Mother CZTSegment
//Done
//Done

Volume CZTSideSegment
CZTSideSegment.Visibility 1
CZTSideSegment.Color 1
CZTSideSegment.Material CZT
CZTSideSegment.Shape BRIK 57.5 0.25 10.0
CZTSideSegment.Mother CZTSideLayer

//Building single side layer of 1 segment, 120 cm x 0.5cm x 20cm
Volume CZTSideLayer
CZTSideLayer.Material Vacuum
CZTSideLayer.Visibility 0
CZTSideLayer.Shape BRIK 57.5 0.25 10.0
// Include this to run in stand-alone
//CZTSideLayer.Mother 0

























