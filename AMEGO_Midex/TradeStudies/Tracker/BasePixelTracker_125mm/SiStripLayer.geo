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
										                                            

// Build One Layer of Segment, this volume also includes the passive frame 40cm x 40cm x 1cm  
Volume SiStripLayer 
SiStripLayer.Material Vacuum
SiStripLayer.Visibility 0
SiStripLayer.Shape BOX 19.5 19.5 0.025
// NEEDS THIS LINE TO VIEW ALONE:


//Placing Wafers into the segment (single tower layer)
For I 4 -14.75 9.75
    For J 4 -14.75 9.75
    	Wafer.Copy Wafer_%I_%J
    	Wafer_%I_%J.Position $I $J 0.0
    	Wafer_%I_%J.Mother SiStripLayer
    Done
Done









































































































