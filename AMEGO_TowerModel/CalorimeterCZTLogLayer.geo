//CZT Detectors confugured in logs 

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////

//Build a single CZT bar: 0.8x0.8x4 cm
Volume CZTBar
CZTBar.Visibility 0
CZTBar.Color 1
CZTBar.Material CZT
CZTBar.Shape BRIK 0.4 0.4 2.0

//Building single segment of CZT, 5cmx5cmx4cm
Volume CZTSegment
CZTSegment.Visibility 1
CZTSegment.Color 1
CZTSegment.Material CZT
CZTSegment.Shape BRIK 2.5 2.5 2.0
//CZTSegment.Mother 0

// Put the CZT bars into the segment
For I 6 -2.08333 0.83333
    For J 6 -2.08333 0.83333
    	CZTBar.Copy CZTBar_%I_%J
    	CZTBar_%I_%J.Position $I $J 0.0
    	CZTBar_%I_%J.Mother CZTSegment
    Done
Done

//Build a single CZT side bar: 0.8x0.8x4 cm
Volume CZTSideBar
CZTSideBar.Visibility 0
CZTSideBar.Color 1
CZTSideBar.Material CZT
CZTSideBar.Shape BRIK 0.4 0.4 2.0

//Building single segment of side CZT, 5cmx5cmx4cm
Volume CZTSideSegment
CZTSideSegment.Visibility 1
CZTSideSegment.Color 1
CZTSideSegment.Material CZT
CZTSideSegment.Shape BRIK 2.5 2.5 2.0
//CZTSideSegment.Mother 0

// Put the CZT bars into the segment
For I 6 -2.08333 0.83333
    For J 6 -2.08333 0.83333
    	CZTSideBar.Copy CZTSideBar_%I_%J
    	CZTSideBar_%I_%J.Position $I $J 0.0
    	CZTSideBar_%I_%J.Mother CZTSideSegment
    Done
Done




