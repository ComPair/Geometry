//Stacking 40 layers of Si, total dimensions 80cm x 80cm x 58.55cm

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo

//Volume World
//World.Material Vacuum
//World.Visibility 0
//World.Color 0
//World.Shape BRIK 500. 500. 500.
//World.Mother 0

///////


Include SiPixelSegment.geo

//This builds one tower of the SiStrip Detector
Volume SiTower
SiTower.Material Vacuum
SiTower.Visibility 0
SiTower.Shape BRIK {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} 7.5
// NEEDS THIS LINE TO VIEW ALONE:
//SiTower.Mother World

For I 10 {-7.5 + 0.75} SegmentThickness
    TrackerSegment.Copy TrackerSegment_%I
    TrackerSegment_%I.Position 0.0 0.0 $I
    //Print %I $I   
    TrackerSegment_%I.Mother SiTower
Done 










