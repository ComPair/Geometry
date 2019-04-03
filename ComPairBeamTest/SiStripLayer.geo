//Build single layer of Si Strips, 4 segments per layer, each segment is 4x4 wafers with no spaces

/////Use these lines to run geometry as standalone
//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo
///////
										
// One Si wafer, 9.5 cm x 9.5 cm x 0.05cm							
Volume Wafer									
Wafer.Material Silicon								
Wafer.Visibility 1								
Wafer.Color 4									
Wafer.Shape BOX 4.75 4.75 0.025 						
										                                            

// Build One Layer of Segment, 9.5 cm x 9.5 cm x 0.05cm	
Volume SiStripLayer 
SiStripLayer.Material Vacuum
SiStripLayer.Visibility 0
SiStripLayer.Shape BOX 4.75 4.75 0.025 
// NEEDS THIS LINE TO VIEW ALONE:
//SiStripLayer.Mother 0
//SiStripLayer.Position 0. 0. 0.

Wafer.Mother SiStripLayer










































































































