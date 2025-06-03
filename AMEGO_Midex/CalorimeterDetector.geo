//Build a single CsI log with log tube

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
Constant CsIBarWidth {1.5/2}
Constant CsIBarLength {38/2}
Constant CalorimeterVerticalWallThickness {0.05}

// Single log 38.0cm x 1.5cm x 1.5 cm
Volume CSILog
CSILog.Material CsI
CSILog.Visibility 1
CSILog.Color 2
CSILog.Shape BOX CsIBarWidth CsIBarWidth CsIBarLength

//Single log tube is 0.5 mm thick and 40 cm long
Volume LogTube
LogTube.Shape BOX 0.8 0.8 20.0
LogTube.Material M55J
LogTube.Visibility 1
LogTube.Color 1
//LogTube.Mother World

Volume LogTubeCutout
LogTubeCutout.Shape Box 0.75 0.75 20.0
LogTubeCutout.Material Vacuum
LogTubeCutout.Visibility 1
LogTubeCutout.Color 1
LogTubeCutout.Position 0 0 0
LogTubeCutout.Mother LogTube

CSILog.Position 0 0 {-20 + 19 + 0.3}
CSILog.Mother LogTubeCutout

//Using Nylon for now, not sure the material of the bumper
Volume LogBumper
LogBumper.Shape BOX 0.75 0.75 0.72
LogBumper.Visibility 1
LogBumper.Material Nylon
LogBumper.Color 7
LogBumper.Position 0 0 {20.0 - 0.72}
LogBumper.Mother LogTubeCutout


