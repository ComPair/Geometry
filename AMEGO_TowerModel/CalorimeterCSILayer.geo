//Build single layer of CsI, 4 segments per layer, each 33 logs each 1.5x1.5x50

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

// Single log 49.5 cm x 1.5cm x 1.5 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX 24.75 0.75 0.75

//Build Single Segment (Tray) of 33 logs 49.5 x 49.5 x 1.5
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 0
CSISegment.Shape BOX 25.0 25. 0.75
//Include this for stand-alone
//CSISegment.Mother 0

//Fill Segment with 40 logs
For I 33 -24.25 1.5
    CSILog.Copy CSILog_%I
    CSILog_%I.Position 0.0 $I 0.0
    CSILog_%I.Mother CSISegment
Done
