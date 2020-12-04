//Build single segment of CsI with 6*6 = 36 fingers. There are 6*6=36 segments per tower and then 4 towers in the whole CsI calorimeter, for a total of 72*72 = 5184 fingers.

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
///////

// Single finger is 1.0cm x 1.0cm x 5.0 cm
Volume GAGGFinger
GAGGFinger.Material GAGG
GAGGFinger.Visibility 1
GAGGFinger.Color 7
GAGGFinger.Shape BOX 0.5 0.5 2.5

//Build Single Segment (Tray): 36 fingers (6x6 ) is 6.6 x 6.6 x 5 cm
Volume GAGGFingerSegment
GAGGFingerSegment.Material Vacuum
GAGGFingerSegment.Visibility 0
GAGGFingerSegment.Shape BOX 3.3 3.3 2.5
//Include this for stand-alone
//GAGGFingerSegment.Mother 0


//Make a segment of the CsI finger calorimeter which is 6x6 crystals
For I 6 -2.75 1.1
	For J 6 -2.75 1.1
    	GAGGFinger.Copy GAGGFinger_%I_%J
    	GAGGFinger_%I_%J.Position $I $J 0.0
    	GAGGFinger_%I_%J.Mother GAGGFingerSegment
    Done
Done



