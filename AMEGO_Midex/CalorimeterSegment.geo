//Build single segment of CsI with 25 logs each 1.5x1.5x38. There are 4 segments per tower and then 4 towers in the whole CsI calorimeter

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


Include CalorimeterDetector.geo
Constant WidthOfLogTube 1.6

//Build Single Segment (Tray) of 25 logs 40 x 40 x 1.6
Volume CSISegment
CSISegment.Material Vacuum
CSISegment.Visibility 1
CSISegment.Shape BOX 0.8 20 20
//Include this for stand-alone
//CSISegment.Mother World

//Fill Segment with 25 logs
For I 25 {20 - WidthOfLogTube/2} {-WidthOfLogTube}
    LogTube.Copy CSILog_%I
    CSILog_%I.Position 0.0 $I 0.0
//    CSILog_%I.Rotation 0 0 0 # The sensitive volume can not be rotated within the detector volume
    CSILog_%I.Mother CSISegment
Done

