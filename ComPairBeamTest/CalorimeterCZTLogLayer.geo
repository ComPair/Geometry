//CZT Detectors confugured in logs 

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo
///////


// Build a single CZT bar: 0.8x0.8x4 cm
Volume CZTBar
CZTBar.Visibility 0
CZTBar.Color 1
CZTBar.Material CZT
CZTBar.Shape BRIK 0.4 0.4 2.0

//Create the single segment of CZT, 5cmx5cmx4.2cm
Volume CZTSegment
CZTSegment.Visibility 1
CZTSegment.Color 1
CZTSegment.Material Vacuum
CZTSegment.Shape BRIK 2.5 2.5 2.1
// NEEDS THIS LINE TO VIEW ALONE:
//CZTSegment.Mother 0

// Put the CZT bars into the segment
For I 6 -2. 0.8
    For J 6 -2. 0.8
    	CZTBar.Copy CZTBar_%I_%J
    	CZTBar_%I_%J.Position $I $J 0.0
    	CZTBar_%I_%J.Mother CZTBlock
    Done
Done


