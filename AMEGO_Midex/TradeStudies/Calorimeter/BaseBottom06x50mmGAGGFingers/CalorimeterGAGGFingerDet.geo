//Build single segment of CsI with 7*7 = 49 fingers. There are 8*8=64 segments per tower and then 4 towers in the whole CsI calorimeter, for a total of 112*112 = 12544 fingers.

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
///////

// Single finger is 0.6cm x 0.6cm x 5.0
Volume GAGGFinger
GAGGFinger.Material GAGG
GAGGFinger.Visibility 1
GAGGFinger.Color 5
GAGGFinger.Shape BOX 0.3 0.3 2.5

//Build Single Segment (Tray): 49 fingers (7 x 7) is 4.8 x 4.8 x 5 cm
Volume GAGGFingerSegment
GAGGFingerSegment.Material Vacuum
GAGGFingerSegment.Visibility 0
GAGGFingerSegment.Shape BOX 2.4 2.4 2.5
//Include this for stand-alone
//GAGGFingerSegment.Mother 0


//Make a segment of the CsI finger calorimeter which is 7x7 crystals
For I 7 -2.1 0.7
	For J 7 -2.1 0.7
    	GAGGFinger.Copy GAGGFinger_%I_%J
    	GAGGFinger_%I_%J.Position $I $J 0.0
    	GAGGFinger_%I_%J.Mother GAGGFingerSegment
    Done
Done



