//Build single layer of CsI, 4 segments per layer, each 26 logs each 1.5x1.5x38

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

# Single log 38.0cm x 1.5cm x 1.5 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX 19.0 0.75 0.75

//Build Single Segment (Tray) of 26 logs 38 x 39.0 x 1.5
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 1
CSISegment.Color 2
CSISegment.Shape BOX 19.0 19.5 0.75   

//Build Single Layer of 4 Segments 80cm x 80cm x1.5cm 
Volume CSILayer
CSILayer.Material Vacuum
CSILayer.Visibility 1
CSILayer.Color 2
CSILayer.Shape BOX 40.0 40. 0.75
//CSILayer.Mother 0

//Fill Segment with 26 logs
For I 26 -18.75 1.5
CSILog.Copy CSILog_%I
CSILog_%I.Position 0.0 $I 0.0
//Print %I $I
CSILog_%I.Mother CSISegment
Done

//Fill Layer with 4 Segments (there will be gaps here)
For I 2 -20.0 40.0
For J 2 -20.0 40.0
CSISegment.Copy CSISegment_%I_%J
CSISegment_%I_%J.Position $I $J 0.0
CSISegment_%I_%J.Mother CSILayer
Done





























































