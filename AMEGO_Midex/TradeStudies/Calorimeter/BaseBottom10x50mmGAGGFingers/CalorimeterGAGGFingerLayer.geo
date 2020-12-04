//Build single layer of CsI with 6*6 = 36 segments. Each segment has 6*6=36 fingers. There are 6*6=36 segments per tower and then 4 towers in the whole CsI calorimeter, for a total of 72*72 = 5184 fingers.

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
//Include ./CalorimeterGAGGFingerDet.geo
///////



//Build Single Layer: 36*36=1296 fingers is 39.5 x 39.5 x 5 cm, plus space for 0.05 cm gap on each side
Volume GAGGFingerLayer
GAGGFingerLayer.Material Vacuum
GAGGFingerLayer.Visibility 0
GAGGFingerLayer.Shape BOX 19.8 19.8 2.5
//Include this for stand-alone
//GAGGFingerLayer.Mother 0



//Fill layer with 36 x 36 fingers, which is 6 x 6 segments.
//Each segment is 6.5 cm wide, with a 0.1 cm gap.
For I 6 -16.5 6.6
	For J 6 -16.5 6.6
    	GAGGFingerSegment.Copy GAGGFingerSegment_%I_%J
    	GAGGFingerSegment_%I_%J.Position $I $J 0.0
    	GAGGFingerSegment_%I_%J.Mother GAGGFingerLayer
    Done
Done


