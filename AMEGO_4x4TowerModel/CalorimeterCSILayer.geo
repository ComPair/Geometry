//Build single layer of CsI, 4 segments per layer, each 26 logs each 1.5x1.5x38

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo
///////

// Single log 38.0cm x 1.5cm x 1.5 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX 19. 0.75 0.75

//Build Single Segment (Tray) of 26 logs 38 x 39 x 1.5
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 0
CSISegment.Shape BOX 19.0 19.5 0.75
//Include this for stand-alone
//CSISegment.Mother 0

//Fill Segment with 26 logs
For I 26 -18.75 1.5
    CSILog.Copy CSILog_%I
    CSILog_%I.Position 0.0 $I 0.0
    CSILog_%I.Mother CSISegment
Done
