//Build single segment of CsI with 6*6 = 36 fingers. There are 6*6=36 segments per tower and then 4 towers in the whole CsI calorimeter, for a total of 72*72 = 5184 fingers.

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
///////

// Single finger is 1.0cm x 1.0cm x 7.4 cm
Volume CSIFinger
CSIFinger.Material CsI
CSIFinger.Visibility 1
CSIFinger.Color 2
CSIFinger.Shape BOX 0.5 0.5 3.7

//Build Single Segment (Tray): 36 fingers (6x6 ) is 6.6 x 6.6 x 7.4 cm
Volume CSIFingerSegment
CSIFingerSegment.Material Vacuum
CSIFingerSegment.Visibility 0
CSIFingerSegment.Shape BOX 3.3 3.3 3.7
//Include this for stand-alone
//CSIFingerSegment.Mother 0


//Make a segment of the CsI finger calorimeter which is 6x6 crystals
For I 6 -2.75 1.1
	For J 6 -2.75 1.1
    	CSIFinger.Copy CSIFinger_%I_%J
    	CSIFinger_%I_%J.Position $I $J 0.0
    	CSIFinger_%I_%J.Mother CSIFingerSegment
    Done
Done



