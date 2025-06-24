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
Constant CalorimeterThickness {CalorimeterSegmentThickness*6}


//This builds one tower of the CsI Detector
Volume CsITower
CsITower.Material Vacuum
CsITower.Visibility 1
CsITower.Shape BRIK 22.5 22.5 {CalorimeterThickness/2}
CsITower.Position 0 0 0
//CsITower.Mother World

//There are 4 calorimeter layers and the are placed 1.5 cm beneath the top of the calorimeter
For I 6 {-5.1 + 1.7/2} 1.7
    CsISegment.Copy CsISegment_%I
    CsISegment_%I.Position 0 0 {$I}
    CsISegment_2.Rotation 0.0 0.0 90.0
    CsISegment_4.Rotation 0.0 0.0 90.0   
    CsISegment_6.Rotation 0.0 0.0 90.0
    CsISegment_%I.Mother CsITower 
Done 



Constant CsIFEEZ 0.3

Volume CSIFEE
CSIFEE.Material ComPairFEEBoard
CSIFEE.Visibility 1
CSIFEE.Color 3
CSIFEE.Shape BOX 20 {CsIFEEZ/2} 4.5

CSIFEE.Copy CSIFEE1
CSIFEE1.Position 0 {22.5-1} 0
CSIFEE1.Mother CsITower

CSIFEE.Copy CSIFEE2
CSIFEE2.Position 0 {-22.5+1} 0
CSIFEE2.Mother CsITower

CSIFEE.Copy CSIFEE3
CSIFEE3.Rotation 0 0 90
CSIFEE3.Position {22.5-1} 0 0
CSIFEE3.Mother CsITower

CSIFEE.Copy CSIFEE4
CSIFEE4.Rotation 0 0 90
CSIFEE4.Position {-22.5+1} 0 0
CSIFEE4.Mother CsITower




Volume EdgeCloseoutLong
EdgeCloseoutLong.Material M55J
EdgeCloseoutLong.Visibility 1
EdgeCloseoutLong.Color 4
EdgeCloseoutLong.Shape BOX 0.05 22.5 5.1

Volume EdgeCloseoutShort
EdgeCloseoutShort.Material M55J
EdgeCloseoutShort.Visibility 1
EdgeCloseoutShort.Color 4
EdgeCloseoutShort.Shape BOX 22.4 0.05 5.1

EdgeCloseoutLong.Copy EdgeCloseoutLong1
EdgeCloseoutLong1.Position {-22.5 + 0.05} 0 0
EdgeCloseoutLong1.Mother CsITower

EdgeCloseoutLong.Copy EdgeCloseoutLong2
EdgeCloseoutLong2.Position {22.5 - 0.05} 0 0
EdgeCloseoutLong2.Mother CsITower

EdgeCloseoutShort.Copy EdgeCloseoutShort1
EdgeCloseoutShort1.Position 0 {-22.5 + 0.05} 0
EdgeCloseoutShort1.Mother CsITower

EdgeCloseoutShort.Copy EdgeCloseoutShort2
EdgeCloseoutShort2.Position 0 {22.5 - 0.05} 0
EdgeCloseoutShort2.Mother CsITower

