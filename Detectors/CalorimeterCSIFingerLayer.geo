//Build single segment of CsI with 6400 fingers. There is 1 segment per tower and then 4 towers in the whole CsI calorimeter

/////Use these lines to run geometry as standalone
SurroundingSphere 100.0  0.0  0.0  0.0  100.0
Include ../materials/Materials.geo
///////

// Single finger is 0.5cm x 0.5cm x 8.0 cm (Baseline is eASTROGAM)
Volume CSIFinger
CSIFinger.Material CsI
CSIFinger.Visibility 1
CSIFinger.Color 2
CSIFinger.Shape BOX 0.25 0.25 4.0

//Build Single Segment (Tray): 6400 fingers (80 x 80) is 40 x 40 x 8 cm
Volume CSIFingerSegment
CSIFingerSegment.Material Vacuum
CSIFingerSegment.Visibility 0
CSIFingerSegment.Shape BOX 20. 20. 4.0
//Include this for stand-alone
CSIFingerSegment.Mother 0

//Fill Segment with 80 x 80 fingers 
For I 80 -19.75 0.5
	For J 80 -19.75 0.5
    	CSIFinger.Copy CSIFinger_%I_%J
    	CSIFinger_%I_%J.Position $I $J 0.0
    	CSIFinger_%I_%J.Mother CSIFingerSegment
    Done
Done


