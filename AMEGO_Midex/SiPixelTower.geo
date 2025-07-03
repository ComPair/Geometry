////////////////////////////////////////////////////
// AMEGO-X Silicon Pixel Tower Geometry File
// Authors: Carolyn Kierans
// Version 2.0: 2025.06.30
// Version 1.0: 2021
// Description: Stacking 40 layers of Si, total
// dimensions 45.182cm x 45.182cm x 60cm.
////////////////////////////////////////////////////
// Edited by Janeth Valverde on 2025.06.30
// - The Silicon Pixel Tower geometry was not 
// modified in this file, but an upgrade was 
// implemented in the Si Pixel Segment geometry 
// included here.
////////////////////////////////////////////////////

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
SiTower.Shape BRIK {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} 30
// NEEDS THIS LINE TO VIEW ALONE:
//SiTower.Mother World

For I 40 {-30 + 0.75} SegmentThickness
    TrackerSegment.Copy TrackerSegment_%I
    TrackerSegment_%I.Position 0.0 0.0 $I
    TrackerSegment_%I.Mother SiTower
Done 










