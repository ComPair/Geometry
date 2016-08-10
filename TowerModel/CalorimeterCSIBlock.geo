//Build single layer of CsI, 4 segments per layer, each 26 logs each 1.5x1.5x38

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

// Single block 1.0cm x 1.5cm x 1.5 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX 0.5 0.75 0.75

//Build Single Segment (Tray) of 26 logs 38 x 39 x 1.5
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 0
CSISegment.Shape BOX 19.0 19.5 0.75
//Include this for stand-alone
//CSISegment.Mother 0

//Fill Segment with 26 x 38 blocks
For I 26 -18.75 1.5
    For J 38 -18.5 1.0
    	CSILog.Copy CSILog_%I_%J
    	CSILog_%I_%J.Position $J $I 0.0
    	CSILog_%I_%J.Mother CSISegment
    Done
Done
