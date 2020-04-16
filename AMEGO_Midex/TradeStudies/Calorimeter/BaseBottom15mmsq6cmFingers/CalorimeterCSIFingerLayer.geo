//Build single segment of CsI with 676 fingers. There is 1 segment per tower and then 4 towers in the whole CsI calorimeter

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
///////

// Single finger is 1.5cm x 1.5cm x 6.0 cm 
Volume CSIFinger
CSIFinger.Material CsI
CSIFinger.Visibility 1
CSIFinger.Color 2
CSIFinger.Shape BOX 0.75 0.75 3.0

//Build Single Segment (Tray): 676 fingers (26 x 26) is 39 x 39 x 6 cm
Volume CSIFingerSegment
CSIFingerSegment.Material Vacuum
CSIFingerSegment.Visibility 0
CSIFingerSegment.Shape BOX 20. 20. 3.0
//Include this for stand-alone
//CSIFingerSegment.Mother 0

//Fill Segment with 26 x 26 fingers 
For I 26 -19.25 1.5
	For J 26 -19.25 1.5
    	CSIFinger.Copy CSIFinger_%I_%J
    	CSIFinger_%I_%J.Position $I $J 0.0
    	CSIFinger_%I_%J.Mother CSIFingerSegment
    Done
Done


