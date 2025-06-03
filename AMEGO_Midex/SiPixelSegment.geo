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
TrackerSegment.Shape BOX {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} {SegmentThickness/2} // J: Before 22.5 22.5 0.75
//TrackerSegment.Mother World


Include SiPixelDetectors.geo
Include SiPixelFrame.geo
TrackerFrame.Position 0 0 {-FEEThickness/2}
TrackerFrame.Mother TrackerSegment

// Constant QuadClusterSeparation 8.43
// Constant QuadClusterMax 16.86
Constant QhadChipZ {SegmentThickness/2 - FEEThickness + 0.025}
Constant FEEZ {SegmentThickness/2 - FEEThickness/2}



// New
//BeginComment

For I 5 {-QuadClusterMaxX} QuadClusterSeparationX
    For J 4 {QuadClusterMaxY} {-QuadClusterSeparationY}
	    For K 2 {-QuadChipWidthX/2 - QuadSeparationInClusterX/2} {QuadChipWidthX + QuadSeparationInClusterX}
	        For L 2 {QuadChipWidthY/2 + QuadSeparationInClusterY/2} {-QuadChipWidthY - QuadSeparationInClusterY}
		    	QuadChip.Copy QuadChipA_%I_%J_%K_%L
		    	QuadChipA_%I_%J_%K_%L.Position {$I+$K} {$J+$L} QhadChipZ
		    	QuadChipA_%I_%J_%K_%L.Mother TrackerSegment
	        Done
	    Done
    Done
Done

For I 4 {-QuadClusterMaxX + QuadClusterSeparationX} QuadClusterSeparationX
	    For K 2 {-QuadChipWidthX/2 - QuadSeparationInClusterX/2} {QuadChipWidthX + QuadSeparationInClusterX}
		    	QuadChip.Copy QuadChipB_%I_5_%K_1
		    	QuadChipB_%I_5_%K_1.Position {$I+$K} {QuadClusterMaxY - 4*QuadClusterSeparationY + QuadChipWidthY/2 + QuadSeparationInClusterY/2} QhadChipZ
		    	QuadChipB_%I_5_%K_1.Mother TrackerSegment
	        Done
	    Done
    Done
Done

For I 3 {-QuadClusterMaxX + 2*QuadClusterSeparationX} QuadClusterSeparationX
	    For K 2 {-QuadChipWidthX/2 - QuadSeparationInClusterX/2} {QuadChipWidthX + QuadSeparationInClusterX}
		    	QuadChip.Copy QuadChipC_%I_5_%K_2
		    	QuadChipC_%I_5_%K_2.Position {$I+$K} {QuadClusterMaxY - 4*QuadClusterSeparationY - QuadChipWidthY/2 - QuadSeparationInClusterY/2} QhadChipZ
		    	QuadChipC_%I_5_%K_2.Mother TrackerSegment
	        Done
	    Done
    Done
Done

QuadChip.Copy QuadChipD_2_5_2_2
QuadChipD_2_5_2_2.Position {-QuadClusterMaxX + QuadClusterSeparationX + QuadChipWidthX/2 + QuadSeparationInClusterX/2} {QuadClusterMaxY - 4*QuadClusterSeparationY - QuadChipWidthY/2 - QuadSeparationInClusterY/2} QhadChipZ
QuadChipD_2_5_2_2.Mother TrackerSegment

//EndComment



//
//For I 4 {-QuadClusterMax - APSWidth} QuadClusterSeparation
//    For J 5 {-QuadClusterMax - APSWidth} QuadClusterSeparation
//	QuadChip.Copy QuadChipA_%I_%J
//	QuadChipA_%I_%J.Position $I $J QhadChipZ
//	QuadChipA_%I_%J.Mother TrackerSegment
//   Done
//Done
//
//
//For I 4 {-QuadClusterMax + APSWidth} QuadClusterSeparation
//    For J 5 {-QuadClusterMax - APSWidth} QuadClusterSeparation
//        QuadChip.Copy QuadChipB_%I_%J
//        QuadChipB_%I_%J.Position $I $J QhadChipZ
//        QuadChipB_%I_%J.Mother TrackerSegment
//   Done
//Done


//For I 4 {-QuadClusterMax - APSWidth} QuadClusterSeparation
//    For J 5 {-QuadClusterMax + APSWidth} QuadClusterSeparation
//        QuadChip.Copy QuadChipC_%I_%J
//        QuadChipC_%I_%J.Position $I $J QhadChipZ
//        QuadChipC_%I_%J.Mother TrackerSegment
//   Done
//Done


//For I 4 {-QuadClusterMax + APSWidth} QuadClusterSeparation
//    For J 5 {-QuadClusterMax + APSWidth} QuadClusterSeparation
//        QuadChip.Copy QuadChipD_%I_%J
//        QuadChipD_%I_%J.Position $I $J QhadChipZ
//        QuadChipD_%I_%J.Mother TrackerSegment
//   Done
//Done


//For I 2 {QuadClusterMax - APSWidth} 4
//    For J 4 {QuadClusterMax + APSWidth} {-QuadClusterSeparation}
//	QuadChip.Copy QuadChipE_%I_%J
//	QuadChipE_%I_%J.Position $I $J QhadChipZ
//	QuadChipE_%I_%J.Mother TrackerSegment
//    Done
//Done

//For I 2 {QuadClusterMax - APSWidth} 4
//    For J 3 {QuadClusterMax - APSWidth} {-QuadClusterSeparation}
//        QuadChip.Copy QuadChipF_%I_%J
//        QuadChipF_%I_%J.Position $I $J QhadChipZ
//        QuadChipF_%I_%J.Mother TrackerSegment
//    Done
//Done

//QuadChip.Copy QuadChip_G
//QuadChip_G.Position {QuadClusterMax - APSWidth} -10.43 QhadChipZ
//QuadChip_G.Mother TrackerSegment
//


#Add the FEE Board which consists of three separate rectangles. The size of these boards are based on the CAD model. // J: Revisit.
// J: Before #Add the FEE Board which consists of three separate squares (assuming standard thickness of 1.57mm). The size of these boards are not based on the CAD model, but instead fill the area between the detectors and the edge of the board, leaving a reasonable margin.

Constant DistFrameBottomFEE 0.5529 // J: New constant

Volume TrackerFEE1
TrackerFEE1.Shape BOX 4.3 4.8 {FEEThickness/2} // J: Before  4.8 4.3 {FEEThickness/2}
TrackerFEE1.Material IsolaP95
TrackerFEE1.Visibility 1
TrackerFEE1.Color 3
TrackerFEE1.Position {-TrackerFrameBaseWidth/2 + 1.3 + 4.3} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 5.55} FEEZ // J: Before  {22.5 - 0.1 -4.9} {-22.5 + 1.3 + 4.3} FEEZ
TrackerFEE1.Mother TrackerSegment

Volume TrackerFEE2
TrackerFEE2.Shape BOX 2.0 2.75 {FEEThickness/2} // J: Before  2.75 2.0 {FEEThickness/2}
TrackerFEE2.Material IsolaP95
TrackerFEE2.Visibility 1
TrackerFEE2.Color 3
TrackerFEE2.Position {-TrackerFrameBaseWidth/2 + 1.3 + 8.6 + 2.0} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 2.75} FEEZ // J: Before {22.5 - 0.1 - 2.75} {-22.5 + 1.3 + 8.6 + 2.0} FEEZ
TrackerFEE2.Mother TrackerSegment

Volume TrackerFEE3
TrackerFEE3.Shape BOX 14.5 {2.6776/2} {FEEThickness/2} // J: Before  0.7 14.5 {FEEThickness/2}
TrackerFEE3.Material IsolaP95
TrackerFEE3.Visibility 1
TrackerFEE3.Color 3
TrackerFEE3.Position {-TrackerFrameBaseWidth/2 + 1.3 + 8.6 + 4.0 + 14.5} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 2.6776/2} FEEZ // J: Before  {22.5 - 0.1 - 0.7} {-22.5 + 1.3 + 8.6 + 4.0 + 14.5} FEEZ
TrackerFEE3.Mother TrackerSegment








//The very bottom of the corner block from the layer above is contained in the top of the segment volume

Shape BOX CornerBlockTopSub1
CornerBlockTopSub1.Parameters {CornerBlockx/2} {CornerBlocky/2} {FEEThickness/2}

Shape BOX CornerBlockTopSub2
CornerBlockTopSub2.Parameters {CornerBlockx/2} {CornerBlocky/2} {FEEThickness/2}

Shape Union CornerBlockTopShape
CornerBlockTopShape.Parameters CornerBlockTopSub1 CornerBlockTopSub2 CornerBlockOrientation

Volume CornerBlockTop
CornerBlockTop.Shape CornerBlockTopShape
CornerBlockTop.Visibility 1
CornerBlockTop.Color 2
CornerBlockTop.Material roTMM3


CornerBlockTop.Copy CornerBlockTop1
CornerBlockTop1.Position {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlockx/2} {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlocky/2} FEEZ 
CornerBlockTop1.Mother TrackerSegment

CornerBlockTop.Copy CornerBlockTop2
CornerBlockTop2.Position {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlocky/2} {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlockx/2} FEEZ
CornerBlockTop2.Rotation 0 0 90
CornerBlockTop2.Mother TrackerSegment

CornerBlockTop.Copy CornerBlockTop3
CornerBlockTop3.Position {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlockx/2} {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlocky/2} FEEZ
CornerBlockTop3.Rotation 0 0 180
CornerBlockTop3.Mother TrackerSegment

CornerBlockTop.Copy CornerBlockTop4
CornerBlockTop4.Position {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlocky/2} {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlockx/2} FEEZ
CornerBlockTop4.Rotation 0 0 270
CornerBlockTop4.Mother TrackerSegment


//Standoff Top X shape
Constant StandoffTopx 0.241
Constant StandoffTopy 1.143
Constant StandoffTopHeight FEEThickness // should actually be 0.282, instead of the FEEThickness of 0.236, but using this value to prevent overlaps with the next layer

Shape BOX StandoffCrossShape1
StandoffCrossShape1.Parameters {StandoffTopx/2} {StandoffTopy/2} {StandoffTopHeight/2}

Shape BOX StandoffCrossShape2
StandoffCrossShape2.Parameters {StandoffTopx/2} {StandoffTopy/2} {StandoffTopHeight/2}

Orientation StandoffCrossOrientation
StandoffCrossOrientation.Position 0 0 0
StandoffCrossOrientation.Rotation 0 0 90

Shape Union StandoffCrossShapeSolid
StandoffCrossShapeSolid.Parameters StandoffCrossShape1 StandoffCrossShape2 StandoffCrossOrientation

Shape TUBS StandOffCrossInnerCutout
StandOffCrossInnerCutout.Parameters 0 {StandoffInnerD/2} {StandoffTopHeight/2} 0 360

Shape Subtraction StandoffCrossShape
StandoffCrossShape.Parameters StandoffCrossShapeSolid StandOffCrossInnerCutout

Volume StandoffCross
StandoffCross.Shape StandoffCrossShape
StandoffCross.Material roTMM3
StandoffCross.Visibility 1
StandoffCross.Color 2

StandoffCross.Copy StandoffCross1
StandoffCross1.Position {-TrackerFrameBaseWidth/2 + Standoffx1} {-TrackerFrameBaseWidth/2 + Standoffy1} {0.75 - StandoffTopHeight/2}
StandoffCross1.Mother TrackerSegment

StandoffCross.Copy StandoffCross2
StandoffCross2.Position {-TrackerFrameBaseWidth/2 + Standoffx4} {-TrackerFrameBaseWidth/2 + Standoffy1} {0.75 - StandoffTopHeight/2}
StandoffCross2.Mother TrackerSegment

StandoffCross.Copy StandoffCross3
StandoffCross3.Position {-TrackerFrameBaseWidth/2 + Standoffx2} {-TrackerFrameBaseWidth/2 + Standoffy2} {0.75 - StandoffTopHeight/2}
StandoffCross3.Mother TrackerSegment

StandoffCross.Copy StandoffCross4
StandoffCross4.Position {-TrackerFrameBaseWidth/2 + Standoffx3} {-TrackerFrameBaseWidth/2 + Standoffy2} {0.75 - StandoffTopHeight/2}
StandoffCross4.Mother TrackerSegment

StandoffCross.Copy StandoffCross5
StandoffCross5.Position {-TrackerFrameBaseWidth/2 + Standoffx2} {-TrackerFrameBaseWidth/2 + Standoffy3} {0.75 - StandoffTopHeight/2}
StandoffCross5.Mother TrackerSegment

StandoffCross.Copy StandoffCross6
StandoffCross6.Position {-TrackerFrameBaseWidth/2 + Standoffx3} {-TrackerFrameBaseWidth/2 + Standoffy3} {0.75 - StandoffTopHeight/2}
StandoffCross6.Mother TrackerSegment

StandoffCross.Copy StandoffCross7
StandoffCross7.Position {-TrackerFrameBaseWidth/2 +  Standoffx1} {-TrackerFrameBaseWidth/2 + Standoffy4} {0.75 - StandoffTopHeight/2}
StandoffCross7.Mother TrackerSegment

StandoffCross.Copy StandoffCross8
StandoffCross8.Position {-TrackerFrameBaseWidth/2 + Standoffx4} {-TrackerFrameBaseWidth/2 + Standoffy4} {0.75 - StandoffTopHeight/2}
StandoffCross8.Mother TrackerSegment
























































































