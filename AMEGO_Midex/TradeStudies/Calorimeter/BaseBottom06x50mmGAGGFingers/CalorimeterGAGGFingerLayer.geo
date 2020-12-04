//Build single layer of CsI with 8*8 = 64 segments. Each segment has 7*7=49 fingers. There are 8*8=64 segments per tower and then 4 towers in the whole CsI calorimeter, for a total of 112*112 = 12544 fingers.

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
//Include ./CalorimeterGAGGFingerDet.geo
///////



//Build Single Layer: 56*56= 3136 fingers is 39.1 x 39.1 x 5 cm
Volume GAGGFingerLayer
GAGGFingerLayer.Material Vacuum
GAGGFingerLayer.Visibility 0
GAGGFingerLayer.Shape BOX 19.55 19.55 2.5
//Include this for stand-alone
//GAGGFingerLayer.Mother 0



//Fill layer with 56 x 56 fingers, which is 8 x 8 segments.
//Each segment is 4.8 cm wide, with a 0.1 cm gap.
For I 8 -17.15 4.9
	For J 8 -17.15 4.9
    	GAGGFingerSegment.Copy GAGGFingerSegment_%I_%J
    	GAGGFingerSegment_%I_%J.Position $I $J 0.0
    	GAGGFingerSegment_%I_%J.Mother GAGGFingerLayer
    Done
Done

