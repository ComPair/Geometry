////////////////////////////////////////////////////
// Geometry file for AstroPix v5 detector
// Authors: Adrien Laviron (NASA GSFC)
//    Heavily modified from A-STEP setup
//    by Yusuke Suda (Hiroshima Univ.)
// Version: 2025.05.07
////////////////////////////////////////////////////
// Edited by Janeth Valverde and Carolyn Kierans
// for ComPair-2 (AMEGO-X prototype) on 2025.06.06
// - Modified the X & Y axis definitions to place 
// the Bus Bars along the Y axis, and all of the
// other components accordingly.
// - All dimensions up to date with ComPair-2 CAD 
// and APS V5 design, including detector sensitive 
// area (red), QC, Bus bars.
// - Added and edited comments.
////////////////////////////////////////////////////

//Build single layer of AstroPix Detectors, each segment has 95 quad chips, and each quad chips is a 2x2 APS array.

/////Use these lines to run geometry as standalone
// SurroundingSphere 20.0  0.0  0.0  0.0  20.0
// Include ../materials/Materials.geo
// Include $MEGALIB/resource/examples/geomega/materials/Materials.geo


///Use these lines to run geometry as standalone
///Use these lines to run geometry as standalone
// Volume World
// World.Material Vacuum
// World.Visibility 1
// World.Color 0
// World.Shape BRIK 500. 500. 500.
// World.Mother 0

// QuadChip: 0.0725 cm +- 0.0015 thick (Assuming 500 um = 0.05 cm for V5)
Constant ChipThickness 0.05
Constant QCWidthX 3.9330
Constant QCWidthY 3.8090
Constant GuardringLeft 0.045
Constant GuardringY 0.044
Constant DigitalPeriphery 0.2295
Constant QCPitchX 0.018
Constant QCPitchY 0.069
Constant QCActivePitchY {QCPitchY+2*GuardringY}
Constant QCActivePitchX {DigitalPeriphery+QCPitchX+GuardringLeft}
// Bus bar
//  thickness estimated using the transmission of 31keV 133Ba line
//  transmission estimated at ~ 350 counts / ~ 520 counts = 67%
//  thickness should be revisited at some point
Constant BBThickness 0.007  // 0.0045 from Adrien's transmission estimates
Constant BBWidth 0.9 
Constant BBOffset_1 0.928 
Constant BBOffset_2 {BBWidth + BBOffset_1 + 1.076} 
Constant QCThickness {ChipThickness+BBThickness}

Volume QuadChip
QuadChip.Material Vacuum
QuadChip.Visibility 0
QuadChip.Color 6
QuadChip.Shape BOX {.5*QCWidthX} {.5*QCWidthY} {.5*QCThickness}
/////Use these lines to run geometry as standalone
// QuadChip.Position 0. 0. 0.
// QuadChip.Mother World

Volume BusBar
BusBar.Material Copper
BusBar.Visibility 1
BusBar.Color 93 
BusBar.Shape BOX {.5*BBWidth} {.5*QCWidthY} {.5*BBThickness}
BusBar.Copy BusBar_1
BusBar_1.Position {BBOffset_1+.5*BBWidth - .5*QCWidthX} {0.} {.5*ChipThickness}
BusBar_1.Mother QuadChip
BusBar.Copy BusBar_2
BusBar_2.Position {BBOffset_2+.5*BBWidth - .5*QCWidthX} {0.} {.5*ChipThickness}  
BusBar_2.Mother QuadChip

// AstroPix v5 chip (active silicon)
// Dimenstion: 1.782 cm x 1.683 cm x 0.007 cm (=Measured depletion thickness for V3, can be changed)
// Pixel size 0.0495 cm x 0.0495 cm x 0.007 cm
// 36 x 34 pixels
Constant DepletionDepth {ChipThickness} // assume full depletion here
Constant ActiveAreaY 1.782
Constant ActiveAreaX 1.683

// Passive silicon
Volume SiSubstrate
SiSubstrate.Material Silicon
SiSubstrate.Visibility 1
SiSubstrate.Color 51 
SiSubstrate.Shape BOX {.5*QCWidthX} {.5*QCWidthY} {.5*ChipThickness}
SiSubstrate.Position {0.} {0.} {-.5*BBThickness}
SiSubstrate.Mother QuadChip

// Active volume in passive QC silicon
Volume APS
APS.Material Silicon
APS.Visibility 1
APS.Color 2 
APS.Shape BOX {.5*ActiveAreaX} {.5*ActiveAreaY} {.5*DepletionDepth}

For I 2 {-.5*QCWidthX+.5*ActiveAreaX+GuardringLeft} {ActiveAreaX+QCActivePitchX}
	For J 2 {-.5*QCWidthY+.5*ActiveAreaY+GuardringY} {ActiveAreaY+QCActivePitchY}
		APS.Copy APS_%I_%J
    APS_%I_%J.Position $I $J {.5*(ChipThickness-DepletionDepth)}
		APS_%I_%J.Mother SiSubstrate
	Done
Done



