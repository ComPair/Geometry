//Build single layer of AstroPix Detectors, each segments has 95 quad chips, and each quad chips is 2x2 APS arrays.

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
										
// One APS wafer, 2 cm x 2 cm x 0.05cm, but here we're only counting the active area which is 19 x 17 mm							
Volume APS									
APS.Material Silicon								
APS.Visibility 1								
APS.Color 2									
APS.Shape BOX 0.95 0.85 0.025 						
	
Constant APSWidth 2
									                                            
// One Quad Chip, 4 x 4 cm
Volume QuadChip
QuadChip.Material Vacuum
QuadChip.Color 1
QuadChip.Visibility 1
QuadChip.Shape BOX 2.0 2.0 0.025
//QuadChip.Mother World

//APS placed in Quad chip. The y position is shifted by 1mm in the postiive direction to account for the 2.5 mm digital peripher
For I 2 -1 2
    For J 2 -1 2
        APS.Copy APS_%I_%J
        APS_%I_%J.Position $I {$J + 0.1} 0.0
        APS_%I_%J.Mother QuadChip
    Done
Done
	

































