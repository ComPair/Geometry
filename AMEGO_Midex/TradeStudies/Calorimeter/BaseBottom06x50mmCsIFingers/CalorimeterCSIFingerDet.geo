//Build single segment of CsI with 7*7 = 49 fingers. There are 8*8=64 segments per tower and then 4 towers in the whole CsI calorimeter, for a total of 112*112 = 12544 fingers.

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
///////

// Single finger is 0.6cm x 0.6cm x 7.4
Volume CSIFinger
CSIFinger.Material CsI
CSIFinger.Visibility 1
CSIFinger.Color 2
CSIFinger.Shape BOX 0.3 0.3 3.7

//Build Single Segment (Tray): 49 fingers (7 x 7) is 4.8 x 4.8 x 7.4 cm
Volume CSIFingerSegment
CSIFingerSegment.Material Vacuum
CSIFingerSegment.Visibility 0
CSIFingerSegment.Shape BOX 2.4 2.4 3.7
//Include this for stand-alone
//CSIFingerSegment.Mother 0


//Make a segment of the CsI finger calorimeter which is 7x7 crystals
For I 7 -2.1 0.7
	For J 7 -2.1 0.7
    	CSIFinger.Copy CSIFinger_%I_%J
    	CSIFinger_%I_%J.Position $I $J 0.0
    	CSIFinger_%I_%J.Mother CSIFingerSegment
    Done
Done



