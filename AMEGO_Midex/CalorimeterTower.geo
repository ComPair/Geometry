//Stacking 4 layers of CSI Segments, total dimensions 45cm x 45cm x 8 cm

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

Include CalorimeterSegment.geo 

//This builds one tower of the CsI Detector
Volume CSITower
CSITower.Material Vacuum
CSITower.Visibility 1
CSITower.Shape BRIK 22.5 22.5 4.0
CSITower.Position 0 0 0
//CSITower.Mother World

//There are 4 calorimeter layers and the are placed 1.5 cm beneath the top of the calorimeter
For I 4 {-4.0 + 0.1 + 1.6/2} 1.6
    CSISegment.Copy CSISegment_%I
    CSISegment_%I.Position {-2.4} 2.4 {$I}
    CSISegment_2.Rotation 0.0 0.0 -90.0
    CSISegment_4.Rotation 0.0 0.0 -90.0   
    CSISegment_%I.Mother CSITower 
Done 

//Front End Boards (Import SiPixelFrame.geo for the FEEThickness constant)

Include SiPixelFrame.geo
Constant CSIFEEZ {-0.75 + FEEThickness/2}

Volume CSIFEE1
CSIFEE1.Material IsolaP95
CSIFEE1.Visibility 1
CSIFEE1.Color 3
CSIFEE1.Shape BOX 20.05 2.33 {FEEThickness/2}

Volume CSIFEE2
CSIFEE2.Material IsolaP95
CSIFEE2.Visibility 1
CSIFEE2.Color 3
CSIFEE2.Shape BOX 2.33 {22.4} {FEEThickness/2}

//The FEE board for each layer
For J 4 {-4.0 + 0.1 + FEEThickness/2} 1.6
    CSIFEE1.Copy CSIFEE1_%J
    CSIFEE2.Copy CSIFEE2_%J
    CSIFEE1_%J.Position {-22.4 + 20.05} {-22.4 + 2.33} $J
    CSIFEE2_%J.Position {22.4 - 2.33} 0 $J
    CSIFEE1_%J.Mother CSITower
    CSIFEE2_%J.Mother CSITower
Done


Volume EdgeCloseoutLong
EdgeCloseoutLong.Material M55J
EdgeCloseoutLong.Visibility 1
EdgeCloseoutLong.Color 4
EdgeCloseoutLong.Shape BOX 0.05 22.5 4.0

Volume EdgeCloseoutShort
EdgeCloseoutShort.Material M55J
EdgeCloseoutShort.Visibility 1
EdgeCloseoutShort.Color 4
EdgeCloseoutShort.Shape BOX 22.4 0.05 4.0

EdgeCloseoutLong.Copy EdgeCloseoutLong1
EdgeCloseoutLong1.Position {-22.5 + 0.05} 0 0
EdgeCloseoutLong1.Mother CSITower

EdgeCloseoutLong.Copy EdgeCloseoutLong2
EdgeCloseoutLong2.Position {22.5 - 0.05} 0 0
EdgeCloseoutLong2.Mother CSITower

EdgeCloseoutShort.Copy EdgeCloseoutShort1
EdgeCloseoutShort1.Position 0 {-22.5 + 0.05} 0
EdgeCloseoutShort1.Mother CSITower

EdgeCloseoutShort.Copy EdgeCloseoutShort2
EdgeCloseoutShort2.Position 0 {22.5 - 0.05} 0
EdgeCloseoutShort2.Mother CSITower


