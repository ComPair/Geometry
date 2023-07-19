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
										
	
//The Frame in the CAD model is assymetric, with the detectors placed slightly closer to the inner edge, but here we will approximate everything as symmetric

//The Tracker Segement
Volume TrackerSegment 
TrackerSegment.Material Vacuum
TrackerSegment.Visibility 1
TrackerSegment.Color 7
TrackerSegment.Shape BOX 22.5 22.5 0.75
//TrackerSegment.Mother World


Include SiPixelDetectors.geo
Include SiPixelFrame.geo
TrackerFrame.Position 0 0 {-FEEThickness/2}
TrackerFrame.Mother TrackerSegment

Constant QuadClusterSeparation 8.43
Constant QuadClusterMax 16.86
Constant QhadChipZ {1.5/2 - FEEThickness + 0.025}
Constant FEEZ {1.5/2 - FEEThickness/2}

For I 4 {-QuadClusterMax - APSWidth} QuadClusterSeparation
    For J 5 {-QuadClusterMax - APSWidth} QuadClusterSeparation
	QuadChip.Copy QuadChipA_%I_%J
	QuadChipA_%I_%J.Position $I $J QhadChipZ
	QuadChipA_%I_%J.Mother TrackerSegment
   Done
Done


For I 4 {-QuadClusterMax + APSWidth} QuadClusterSeparation
    For J 5 {-QuadClusterMax - APSWidth} QuadClusterSeparation
        QuadChip.Copy QuadChipB_%I_%J
        QuadChipB_%I_%J.Position $I $J QhadChipZ
        QuadChipB_%I_%J.Mother TrackerSegment
   Done
Done


For I 4 {-QuadClusterMax - APSWidth} QuadClusterSeparation
    For J 5 {-QuadClusterMax + APSWidth} QuadClusterSeparation
        QuadChip.Copy QuadChipC_%I_%J
        QuadChipC_%I_%J.Position $I $J QhadChipZ
        QuadChipC_%I_%J.Mother TrackerSegment
   Done
Done


For I 4 {-QuadClusterMax + APSWidth} QuadClusterSeparation
    For J 5 {-QuadClusterMax + APSWidth} QuadClusterSeparation
        QuadChip.Copy QuadChipD_%I_%J
        QuadChipD_%I_%J.Position $I $J QhadChipZ
        QuadChipD_%I_%J.Mother TrackerSegment
   Done
Done


For I 2 {QuadClusterMax - APSWidth} 4
    For J 4 {QuadClusterMax + APSWidth} {-QuadClusterSeparation}
	QuadChip.Copy QuadChipE_%I_%J
	QuadChipE_%I_%J.Position $I $J QhadChipZ
	QuadChipE_%I_%J.Mother TrackerSegment
    Done
Done

For I 2 {QuadClusterMax - APSWidth} 4
    For J 3 {QuadClusterMax - APSWidth} {-QuadClusterSeparation}
        QuadChip.Copy QuadChipF_%I_%J
        QuadChipF_%I_%J.Position $I $J QhadChipZ
        QuadChipF_%I_%J.Mother TrackerSegment
    Done
Done

QuadChip.Copy QuadChip_G
QuadChip_G.Position {QuadClusterMax - APSWidth} -10.43 QhadChipZ
QuadChip_G.Mother TrackerSegment



#Add the FEE Board which consists of three separate squares (assuming standard thickness of 1.57mm). The size of these boards are not based on the CAD model, but instead fill the area between the detectors and the edge of the board, leaving a reasonable margin.
Volume TrackerFEE1
TrackerFEE1.Shape BOX 4.9 4.3 {FEEThickness/2}
TrackerFEE1.Material IsolaP95
TrackerFEE1.Visibility 1
TrackerFEE1.Color 3
TrackerFEE1.Position {22.5 - 0.1 -4.9} {-22.5 + 1.3 + 4.3} FEEZ
TrackerFEE1.Mother TrackerSegment

Volume TrackerFEE2
TrackerFEE2.Shape BOX 2.75 2.0 {FEEThickness/2}
TrackerFEE2.Material IsolaP95
TrackerFEE2.Visibility 1
TrackerFEE2.Color 3
TrackerFEE2.Position {22.5 - 0.1 - 2.75} {-22.5 + 1.3 + 8.6 + 2.0} FEEZ
TrackerFEE2.Mother TrackerSegment

Volume TrackerFEE3
TrackerFEE3.Shape BOX 0.7 14.5 {FEEThickness/2}
TrackerFEE3.Material IsolaP95
TrackerFEE3.Visibility 1
TrackerFEE3.Color 3
TrackerFEE3.Position {22.5 - 0.1 - 0.7} {-22.5 + 1.3 + 8.6 + 4.0 + 14.5} FEEZ
TrackerFEE3.Mother TrackerSegment


























































































