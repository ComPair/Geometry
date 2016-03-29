//Build single layer of Si Strips, 4 segments per layer, each segment is 4x4 wafers with no spaces

/////Use these lines to run geometry as standalone
//SurroundingSphere 300.0  0.0  0.0  0.0  300.0
//Include ../materials/Materials.geo
///////
										
// One Si wafer, 10cm x 10 cm x 0.05cm							
Volume Wafer									
Wafer.Material Silicon								
Wafer.Visibility 1								
Wafer.Color 4									
Wafer.Shape BOX 5.0 5.0 0.025 						
										
// One Segment composed of 4x4 wafers, total dimensions 40cm x 40cm x 0.05cm 	
Volume Segment									
Segment.Material Vacuum								
Segment.Visibility 0								
Segment.Shape BOX 20.0 20.0 0.025                                               

// Build One Layer of Tracker, 80cm x 80cm x 0.05cm ** NO SPACING BETWEEN SEGMENTS 
Volume SiStripLayer 
SiStripLayer.Material Vacuum
SiStripLayer.Visibility 0
SiStripLayer.Shape BOX 40.0 40.0 0.025

//Placing Wafers into single segment
For I 4.0 -15 10.0
For J 4.0 -15 10.0
Wafer.Copy Wafer_%I_%J
Wafer_%I_%J.Position $I $J 0.0
Wafer_%I_%J.Mother Segment
Done
Done

//Placing Segments into single layer, rotate each one 90dg
For I 2 -20.0 40.0
For J 2 -20.0 40.0
Segment.Copy Segment_%I_%J
Segment_%I_%J.Position $I $J 0.0
Segment_1_1.Rotation 0.0 0.0 0.0
Segment_1_2.Rotation 0.0 0.0 270.0
Segment_2_1.Rotation 0.0 0.0 90.0
Segment_2_2.Rotation 0.0 0.0 180.0
Segment_%I_%J.Mother SiStripLayer
Done
Done










































































































