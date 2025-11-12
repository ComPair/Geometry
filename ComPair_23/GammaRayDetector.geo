////////////////////////////////////////////////////
// ComPair-2 Gamma Ray Detector Geometry File
// Authors: Carolyn Kierans	
// Version 2.0: 2025.06.06
// Version 1.0: 2023
// Description: The Gamma Ray Detector (GRD)
// combines the tracker and calorimeter and all of
// the support structure.
////////////////////////////////////////////////////
// Edited by Janeth Valverde on 2025.06.06
// - Changed 270 deg SiTower rotation to 0 after
// FEE board was positioned along the Mass Model
// X axis, and cutouts and QuadChips with Bus Bars
// were positioned accordingly.
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


Volume GammaRayDetector
GammaRayDetector.Shape BOX {52.0/2} {50.0/2} 14.6
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

Constant TrackerZ 3.95

Volume Tracker
Tracker.Material Vacuum
Tracker.Visibility 1
Tracker.Shape BRIK {45.45/2} {45.45/2} {TrackerThickness/2}
Tracker.Position 0 0 TrackerZ 
Tracker.Mother GammaRayDetector

Volume CsICalorimeter
CsICalorimeter.Material Vacuum
CsICalorimeter.Shape BRIK {45.45/2} {45.45/2} {CalorimeterThickness/2}
CsICalorimeter.Position 0 0 {TrackerZ - TrackerThickness/2 - CalorimeterThickness/2 - SpaceBtwTkrCal}
CsICalorimeter.Mother GammaRayDetector

Constant SpaceBtwTkrCal 0.6

SiTower.Position 0 0 0.0
SiTower.Rotation 0.0 0.0 0.0 
SiTower.Mother Tracker 


CsITower.Position 0 0 0
CsITower.Rotation 0 0 0
CsITower.Mother CsICalorimeter


//Heat Pipes, assumed to have a wall thickness of 2mm of aluminium
Constant HeatPipeOffset 47.05
Constant HeatPipeZ 0

Volume HeatPipe
HeatPipe.Shape TUBE 0 1.2 11.5 0 360
HeatPipe.Material Alu6061
HeatPipe.Visibility 1
HeatPipe.Color 9

Volume HeatPipeInner
HeatPipeInner.Shape TUBE 0 1.0 11.5 0 360
HeatPipeInner.Material Vacuum
HeatPipeInner.Visibility 1
HeatPipeInner.Color 9
HeatPipeInner.Mother HeatPipe

Volume HeatPipeAmmonia
HeatPipeAmmonia.Shape TUBE 0 1.0 11.5 0 360
HeatPipeAmmonia.Material Ammonia
HeatPipeAmmonia.Visibility 0
HeatPipeAmmonia.Color 8
HeatPipeAmmonia.Mother HeatPipeInner

For J 2 -16 -19.5
    For I 2 0 -2.4
        HeatPipe.Copy HeatPipe_2_%I_%J
        HeatPipe_2_%I_%J.Position {-HeatPipeOffset+45.45/2} {$I+$J+45.45/2} HeatPipeZ
        HeatPipe_2_%I_%J.Mother GammaRayDetector
    Done
Done



//GRD Support ARMs 
//Volume CornerSupport
//CornerSupport.Material M55J
//CornerSupport.Visibility 1
//CornerSupport.Color 11
//CornerSupport.Shape BOX 4.1 0.3 {35.25 - 30 + 7.5}


//For I 2 {-48 + 4.1 + 45.45/2} 42
//    For J 2 {-48 + 45.45/2} 50
//        CornerSupport.Copy CornerSupport1_%I_%J
//        CornerSupport1_%I_%J.Position $I $J -0.6
//        CornerSupport1_%I_%J.Rotation 0 0 0
//        CornerSupport1_%I_%J.Mother GammaRayDetector
//    Done
//Done

//For I 2 {-48 + 4.1 + 0.3 + 45.45/2} 41.0
//    For J 2 {-48 + 0.3 + 45.45/2} 50
//        CornerSupport.Copy CornerSupport2_%I_%J
//        CornerSupport2_%I_%J.Position $J $I -0.6
//        CornerSupport2_%I_%J.Rotation 0 0 90
//        CornerSupport2_%I_%J.Mother GammaRayDetector
//    Done
//Done


