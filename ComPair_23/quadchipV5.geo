///////////////////////////////////////////////////
// Geometry file for AstroPix v5 detector        //
// Authors: Adrien Laviron (NASA GSFC)           //
//    Heavily modified from A-STEP setup         //
//    by Yusuke Suda (Hiroshima Univ.)           //
// Version: 2025.05.07      
///////////////////////////////////////////////////
// Edited by: Janeth Valverde and Carolyn Kierans//
// On: 2025.06.06
// Adding comments
///////////////////////////////////////////////////

//Build single layer of AstroPix Detectors, each segments has 95 quad chips, and each quad chips is 2x2 APS arrays.

/////Use these lines to run geometry as standalone
// SurroundingSphere 20.0  0.0  0.0  0.0  20.0
// #Include ../materials/Materials.geo
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
// Here I use Width for X and Length for Y
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
//  width and offset are from A-STEP
//  thickness estimated using the transmission of 31keV 133Ba line
//  transmission estimated at ~ 350 counts / ~ 520 counts = 67%
//  thickness should be revisited at some point
Constant BBThickness 0.0045
Constant BBWidth 0.9 // J: Before: Constant BBWidth 1.2
Constant BBOffset_1 0.928 // J: Before Constant BBOffset 0.38. New constant.
Constant BBOffset_2 {BBWidth + BBOffset_1 + 1.076} // J: New constant.
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
BusBar.Color 93 // J: Before 46
BusBar.Shape BOX {.5*BBWidth} {.5*QCWidthY} {.5*BBThickness}
BusBar.Copy BusBar_1
BusBar_1.Position {BBOffset_1+.5*BBWidth - .5*QCWidthX} {0.} {.5*ChipThickness}
BusBar_1.Mother QuadChip
BusBar.Copy BusBar_2
BusBar_2.Position {BBOffset_2+.5*BBWidth - .5*QCWidthX} {0.} {.5*ChipThickness} // J* 
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
SiSubstrate.Color 51 // J: Before 4
SiSubstrate.Shape BOX {.5*QCWidthX} {.5*QCWidthY} {.5*ChipThickness}
SiSubstrate.Position {0.} {0.} {-.5*BBThickness}
SiSubstrate.Mother QuadChip

// Active volume (just the pixel array) in passive silicon
Volume APS
APS.Material Silicon
APS.Visibility 1
APS.Color 2 // J: Before 7
APS.Shape BOX {.5*ActiveAreaX} {.5*ActiveAreaY} {.5*DepletionDepth}

For I 2 {-.5*QCWidthX+.5*ActiveAreaX+GuardringLeft} {ActiveAreaX+QCActivePitchX}
	For J 2 {-.5*QCWidthY+.5*ActiveAreaY+GuardringY} {ActiveAreaY+QCActivePitchY}
		APS.Copy APS_%I_%J
    APS_%I_%J.Position $I $J {.5*(ChipThickness-DepletionDepth)}
		APS_%I_%J.Mother SiSubstrate
	Done
Done


// Detector definition and performances
// C: Define Tracker APS detectors, which are appriximated as strip detectors so they can be tracking elements? J: Rest of dimensions close to before.
Strip2D         AstroPix
AstroPix.SensitiveVolume  APS
AstroPix.DetectorVolume   QuadChip
// C: Total # of strips in x and y assume 0.5 mm pixel size?
AstroPix.StripNumber      36 34  // J: Before 38 34, strips in pixel?
AstroPix.Offset           0.0 0.0
AstroPix.StructuralPitch  {QCActivePitchY} {QCActivePitchX} 0.
// Z structural pitch = Layer spacing?
AstroPix.StructuralOffset {GuardringY} {DigitalPeriphery} {ChipThickness-DepletionDepth}

// C: Pixel Properties
AstroPix.NoiseThreshold       0.0001 // J: Before 25
AstroPix.TriggerThreshold     0.0001 // J: Before 25

// Measured values from V2LoResChip
AstroPix.EnergyResolution Gauss 14.4 14.4 1.47
AstroPix.EnergyResolution Gauss 17.8 17.8 0.94
AstroPix.EnergyResolution Gauss 22.2 22.2 1.62 // J: Before 25  25 5.0
AstroPix.EnergyResolution Gauss 31.0 31.0 1.65 // J: Before 122 122 5.0
AstroPix.EnergyResolution Gauss 59.5 59.5 1.30 // J: Before 662 662 5.6


// Trigger Criteria
Trigger SingleCB
SingleCB.Veto false
SingleCB.TriggerByDetector true
SingleCB.Detector AstroPix 1
