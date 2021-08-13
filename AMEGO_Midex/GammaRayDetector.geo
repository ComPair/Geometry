//The Gamma Ray Detector (GRD) combines the tracker and calorimeter and all of the support structure.

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


Volume GammaRayDetector
GammaRayDetector.Shape BOX 55.0 55.0 36.25
GammaRayDetector.Material Vacuum
GammaRayDetector.Visibility 0
GammaRayDetector.Color 9
//INCLUDE THE FOLLOWING LINE TO VIEW ALONE
//GammaRayDetector.Mother World

# This is our Tracker
Include SiPixelTower.geo
Include SiPixelProperties.det

# This is our CsI calorimeter
Include CalorimeterTower.geo
Include CalorimeterProperties.det

Volume Tracker
Tracker.Material Vacuum
Tracker.Visibility 0
Tracker.Shape BRIK 45.45 45.45 30.0
Tracker.Position 0. 0. 3.95
Tracker.Mother GammaRayDetector

Volume CSICalorimeter
CSICalorimeter.Material Vacuum
CSICalorimeter.Shape BRIK 45.45 45.45 4.0
CSICalorimeter.Position 0.0 0.0 -30.65
CSICalorimeter.Mother GammaRayDetector

Constant SpaceBtwTowers 0.9
Constant SpaceBtwTkrCal 0.6

# Adds towers to each of the detector volumes
For I 2 {-22.5 - SpaceBtwTowers/2} {45.0 + SpaceBtwTowers}
    For J 2 {-22.5 - SpaceBtwTowers/2} {45.0 + SpaceBtwTowers}
    	SiTower.Copy SiTower_%I_%J
		SiTower_%I_%J.Position $I $J 0.0
		SiTower_1_1.Rotation 0.0 0.0 270.0
		SiTower_1_2.Rotation 0.0 0.0 180.0   
		SiTower_2_1.Rotation 0.0 0.0 0.0
		SiTower_2_2.Rotation 0.0 0.0 90.0
		SiTower_%I_%J.Mother Tracker 
     Done
Done

For I 2 {-22.5 - SpaceBtwTowers/2} {45.0 + SpaceBtwTowers}
    For J 2 {-22.5 - SpaceBtwTowers/2} {45.0 + SpaceBtwTowers}
        CSITower.Copy CSITower_%I_%J
        CSITower_%I_%J.Position $I $J 0.0
	CSITower_1_1.Rotation 0.0 0.0 270.0
        CSITower_1_2.Rotation 0.0 0.0 180.0
        CSITower_2_1.Rotation 0.0 0.0 0.0
        CSITower_2_2.Rotation 0.0 0.0 90.0
        CSITower_%I_%J.Mother CSICalorimeter
    Done
Done


//Heat Pipes, assumed to have a wall thickness of 2mm of aluminium
Constant HeatPipeOffset 47.05
Constant HeatPipeZ -1.15

Volume HeatPipe
HeatPipe.Shape TUBE 0 1.2 35.1 0 360
HeatPipe.Material Alu6061
HeatPipe.Visibility 1
HeatPipe.Color 9

Volume HeatPipeInner
HeatPipeInner.Shape TUBE 0 1.0 35.1 0 360
HeatPipeInner.Material Vacuum
HeatPipeInner.Visibility 1
HeatPipeInner.Color 9
HeatPipeInner.Mother HeatPipe

Volume HeatPipeAmmonia
HeatPipeAmmonia.Shape TUBE 0 1.0 35.1 0 360
HeatPipeAmmonia.Material Ammonia
HeatPipeAmmonia.Visibility 0
HeatPipeAmmonia.Color 8
HeatPipeAmmonia.Mother HeatPipeInner

For J 2 16 19.5
    For I 2 0 2.4
        HeatPipe.Copy HeatPipe_0_%I_%J
        HeatPipe_0_%I_%J.Position HeatPipeOffset {$I+$J} HeatPipeZ
        HeatPipe_0_%I_%J.Mother GammaRayDetector
    Done
Done

For J 2 16 19.5
    For I 2 0 2.4
        HeatPipe.Copy HeatPipe_1_%I_%J
        HeatPipe_1_%I_%J.Position {$I+$J} {-HeatPipeOffset} HeatPipeZ
        HeatPipe_1_%I_%J.Mother GammaRayDetector
    Done
Done

For J 2 -16 -19.5
    For I 2 0 -2.4
        HeatPipe.Copy HeatPipe_2_%I_%J
        HeatPipe_2_%I_%J.Position {-HeatPipeOffset} {$I+$J} HeatPipeZ
        HeatPipe_2_%I_%J.Mother GammaRayDetector
    Done
Done

For J 2 -16 -19.5
    For I 2 0 -2.4
        HeatPipe.Copy HeatPipe_3_%I_%J
        HeatPipe_3_%I_%J.Position {$I+$J} HeatPipeOffset HeatPipeZ
        HeatPipe_3_%I_%J.Mother GammaRayDetector
    Done
Done



//GRD Support ARMs
Volume CornerSupport
CornerSupport.Material M55J
CornerSupport.Visibility 1
CornerSupport.Color 11
CornerSupport.Shape BOX 4.1 0.3 36.25


For I 2 {-48 + 4.1} 87.8
    For J 2 {-48} 96
        CornerSupport.Copy CornerSupport1_%I_%J
        CornerSupport1_%I_%J.Position $I $J 0.0
        CornerSupport1_%I_%J.Rotation 0 0 0
        CornerSupport1_%I_%J.Mother GammaRayDetector
    Done
Done

For I 2 {-48 + 4.1 + 0.3} 87.2
    For J 2 {-48 + 0.3} 95.4
        CornerSupport.Copy CornerSupport2_%I_%J
        CornerSupport2_%I_%J.Position $J $I 0.0
        CornerSupport2_%I_%J.Rotation 0 0 90
        CornerSupport2_%I_%J.Mother GammaRayDetector
    Done
Done

Volume SideSupport
SideSupport.Material M55J
SideSupport.Visibility 1
SideSupport.Color 11
SideSupport.Shape TRD1 7.5 3.5 0.3 36.25

For I 2 {-48} 96
    SideSupport.Copy SideSupport1_%I
    SideSupport1_%I.Position $I 0 0
    SideSupport1_%I.Rotation 0 0 90
    SideSupport1_%I.Mother GammaRayDetector
Done

For I 2 {-48} 96
    SideSupport.Copy SideSupport2_%I
    SideSupport2_%I.Position 0 $I 0
    SideSupport2_%I.Rotation 0 0 0
    SideSupport2_%I.Mother GammaRayDetector
Done

Volume SideSupportT
SideSupportT.Material M55J
SideSupportT.Visibility 1
SideSupportT.Color 11
SideSupportT.Shape BOX 2.0 0.3 36.25

For I 2 {-48 - 0.3 - 2} 100.6
    SideSupportT.Copy SideSupportT1_%I
    SideSupportT1_%I.Position $I 0 0
    SideSupportT1_%I.Rotation 0 0 0
    SideSupportT1_%I.Mother GammaRayDetector
Done

For I 2 {-48 -0.3 - 2} 100.6
    SideSupportT.Copy SideSupportT2_%I
    SideSupportT2_%I.Position 0 $I 0
    SideSupportT2_%I.Rotation 0 0 90
    SideSupportT2_%I.Mother GammaRayDetector
Done

Volume Backplane
Backplane.Material IsolaP95
Backplane.Visibility 1
Backplane.Color 3
Backplane.Shape BOX 4.5 0.3 35.1

Backplane.Copy Backplane1
Backplane1.Position {48 - 0.3} {-34} HeatPipeZ
Backplane1.Rotation 0 0 90
Backplane1.Mother GammaRayDetector

Backplane.Copy Backplane2
Backplane2.Position {34} {48 - 0.3} HeatPipeZ
Backplane2.Rotation 0 0 0
Backplane2.Mother GammaRayDetector

Backplane.Copy Backplane3
Backplane3.Position {-48 + 0.3} {34} HeatPipeZ
Backplane3.Rotation 0 0 90
Backplane3.Mother GammaRayDetector

Backplane.Copy Backplane4
Backplane4.Position {-34} {-48 + 0.3} HeatPipeZ
Backplane4.Rotation 0 0 0
Backplane4.Mother GammaRayDetector





