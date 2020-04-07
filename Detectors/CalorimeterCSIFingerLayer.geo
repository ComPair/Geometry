//Build single segment of CsI with TBD fingers. There is 1 segment per tower and then 4 towers in the whole CsI calorimeter

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo
///////

// Single log 38.0cm x 1.5cm x 1.5 cm
Volume CSIFinger
CSIFinger.Material CsI
CSIFinger.Visibility 1
CSIFinger.Color 2
CSIFinger.Shape BOX 0.75 0.75 19.0

//Build Single Segment (Tray) of 26 logs 38 x 39 x 1.5
Volume CSISegment
CSIFingerSegment.Material Vacuum
CSIFingerSegment.Visibility 0
CSIFingerSegment.Shape BOX 0.75 19.5 19.0
//Include this for stand-alone
//CSIFingerSegment.Mother 0

//Fill Segment with 26 logs
For I 26 -18.75 1.5
    CSIFinger.Copy CSIFinger%I
    CSIFinger%I.Position 0.0 $I 0.0
    CSIFinger%I.Mother CSIFingerSegment
Done
