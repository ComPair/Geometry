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
Constant CalorimeterCompositeSpacer 0.1
Constant UnibodyWidth {24*CsILogWidth + CalorimeterCompositeSpacer*23}
Constant UnibodyPitch {CsILogWidth + CalorimeterCompositeSpacer}
Constant CalorimeterSegmentThickness {CsILogWidth + CalorimeterCompositeSpacer*2}

//Build Single Segment (Tray) of 24 logs 40 x 40 x 1.6
Volume CsISegment
CsISegment.Material Vacuum
CsISegment.Visibility 0
CsISegment.Shape BOX 20 20 {CalorimeterSegmentThickness/2}
//Include this for stand-alone
//CsISegment.Mother World

Volume CsILogSpacer
CsILogSpacer.Material M55J
CsILogSpacer.Visibility 1
CsILogSpacer.Shape BOX {CsILogLength/2} {CalorimeterCompositeSpacer/2} {CsILogWidth/2}


//Fill Segment with 24 logs
For I 24 {UnibodyWidth/2 - UnibodyPitch/2} {-UnibodyPitch}
    CsILog.Copy CsILog_%I
    CsILog_%I.Position 0.0 $I 0.0
    CsILog_%I.Rotation 0 90 0   
    CsILog_%I.Mother CsISegment
Done

//Fill Segment with 25 spacers
For I 25 {UnibodyWidth/2} {-UnibodyPitch}
    CsILogSpacer.Copy CsILogSpacer_%I
    CsILogSpacer_%I.Position 0.0 $I 0.0
    CsILogSpacer_%I.Visibility 1
    CsILogSpacer_%I.Mother CsISegment
Done


Volume CsISegmentTop
CsISegmentTop.Material M55J
CsISegmentTop.Visibility 1
CsISegmentTop.Shape BOX {CsILogLength/2} {CsILogLength/2} {CalorimeterCompositeSpacer/2}
CsISegmentTop.Position 0 0 {UnibodyPitch/2}
CsISegmentTop.Mother CsISegment


Volume CsISegmentBottom
CsISegmentBottom.Material M55J
CsISegmentBottom.Visibility 1
CsISegmentBottom.Shape BOX {CsILogLength/2} {CsILogLength/2} {CalorimeterCompositeSpacer/2}
CsISegmentBottom.Position 0 0 {-UnibodyPitch/2}
CsISegmentBottom.Mother CsISegment

