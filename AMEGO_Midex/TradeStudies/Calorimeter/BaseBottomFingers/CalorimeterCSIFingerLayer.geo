//Build single segment of CsI with 6400 fingers. There is 1 segment per tower and then 4 towers in the whole CsI calorimeter

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../../../../materials/Materials.geo
///////



//Build Single Layer: 6400 fingers (80 x 80) is 40 x 40 x 8 cm
Volume CSIFingerLayer
CSIFingerLayer.Material Vacuum
CSIFingerLayer.Visibility 0
CSIFingerLayer.Shape BOX 20. 20. 4.0
//Include this for stand-alone
//CSIFingerSegment.Mother 0



//Fill layer with 80 x 80 fingers, which is 10 x 10 segments
For I 10 -18 4
	For J 10 -18 4
    	CSIFingerSegment.Copy CSIFingerSegment_%I_%J
    	CSIFingerSegment_%I_%J.Position $I $J 0.0
    	CSIFingerSegment_%I_%J.Mother CSIFingerLayer
    Done
Done


