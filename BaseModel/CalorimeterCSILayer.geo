//Build single layer of CsI, 3 segments per layer, each segment is 1 x 82 logs

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

# Single log 33.333cm x 1.2cm x 1.2 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX 16.666 0.6 0.6

//Build Single Segment (Tray) of 82 logs 33.333 x 100.0 x 1.2
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 1
CSISegment.Color 2
CSISegment.Shape BOX 16.666 50. 0.6   

//Build Single Layer of 3 Segments 100cm x 100cm x1.2cm 
Volume CSILayer
CSILayer.Material Vacuum
CSILayer.Visibility 1
CSILayer.Color 2
CSILayer.Shape BOX 50.0 50. 0.6
//CSILayer.Mother 0

//Fill Segment with 82 logs
For I 82 -49.4 1.2
CSILog.Copy CSILog_%I
CSILog_%I.Position 0.0 $I 0.0
//Print %I $I
CSILog_%I.Mother CSISegment
Done

//Fill Layer with 3 Segments
For I 3 -33.333 33.333
CSISegment.Copy CSISegment_%I
CSISegment_%I.Position $I 0.0 0.0
CSISegment_%I.Mother CSILayer
Done





























































