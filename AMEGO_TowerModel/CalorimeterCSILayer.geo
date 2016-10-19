//Build single layer of CsI, 4 segments per layer, each 32 logs each 1.5x1.5x48

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

// Single log 48.0cm x 1.5cm x 1.5 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX 24. 0.75 0.75

//Build Single Segment (Tray) of 32 logs 48 x 48 x 1.5
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 0
CSISegment.Shape BOX 24.0 24.5 0.75
//Include this for stand-alone
//CSISegment.Mother 0

//Fill Segment with 32 logs
For I 32 -23.25 1.5
    CSILog.Copy CSILog_%I
    CSILog_%I.Position 0.0 $I 0.0
    CSILog_%I.Mother CSISegment
Done
