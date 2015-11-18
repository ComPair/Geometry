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

//Building single segment of CZT, 50cm x 50cm x 0.5cm 
Volume CZTSegment
CZTSegment.Visibility 1
CZTSegment.Color 1
CZTSegment.Material CZT
CZTSegment.Shape BRIK 25.0 25.0 0.5

//Building single layer of 4 segments, 100cm x 100cm x 0.5cm
Volume CZTLayer
CZTLayer.Material Vacuum
CZTLayer.Visibility 0
CZTLayer.Shape BRIK 50.0 50.0 0.5
//CZTLayer.Mother 0

//You can write a loop like this if you want to place wafers into a segment....
//For I  ? ? ?
//For J  ? ? ?
//CZTWafer.Copy Wafer_%I_%J
//CZTWafer_%I_%J.Position $I $J 0.0
//CZTWafer_%I_%J.Mother CZTSegment
//Done
//Done

//Placing Segments into single layer, rotate each one 90dg
For I 2 -25.0 50.0
For J 2 -25.0 50.0
CZTSegment.Copy CZTSegment_%I_%J
CZTSegment_%I_%J.Position $I $J 0.0
CZTSegment_1_1.Rotation 0.0 0.0 0.0
CZTSegment_1_2.Rotation 0.0 0.0 270.0
CZTSegment_2_1.Rotation 0.0 0.0 90.0
CZTSegment_2_2.Rotation 0.0 0.0 180.0
CZTSegment_%I_%J.Mother CZTLayer
Done
Done





















