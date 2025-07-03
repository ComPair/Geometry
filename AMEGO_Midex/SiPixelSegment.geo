////////////////////////////////////////////////////
// AMEGO-X Silicon Pixel Segment Geometry File
// Authors: Carolyn Kierans
// Version 2.0: 2025.06.30
// Version 1.0: 2021
// Description: Build single layer of AstroPix
// Detectors, each segments has 95 quad chips.
////////////////////////////////////////////////////
// Edited by Janeth Valverde and Carolyn Kierans
// on 2025.06.30, as propagated from the ComPair-2 
// mass model upgrade:
// - Updated TrackerSegment shape and QhadChip Z
// dimensions.
// - Defined new constants.
// - Repositioned QuadChips to adequately
// represent the CAD assymetry.
// - Split FEE board in three more pieces to
// account for M-shaped bottom left corner.
// - Added corner blocks and standoffs.
////////////////////////////////////////////////////


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
										
	
//The QuadChip placement in the Segment CAD model is assymetric, with the detectors placed slightly closer to the left edge.

//The Tracker Segement
Volume TrackerSegment 
TrackerSegment.Material Vacuum
TrackerSegment.Visibility 1
TrackerSegment.Color 7
TrackerSegment.Shape BOX {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} {SegmentThickness/2} 
//TrackerSegment.Mother World


Include SiPixelProperties.det 
Include quadchipV5.geo
Include SiPixelFrame.geo
TrackerFrame.Position 0 0 {-FEEThickness/2}
TrackerFrame.Mother TrackerSegment

Constant QhadChipZ {SegmentThickness/2 - FEEThickness + QCThickness/2} 
Constant FEEZ {SegmentThickness/2 - FEEThickness/2}




For I 5 {-QuadClusterMaxX} QuadClusterSeparationX
    For J 4 {QuadClusterMaxY} {-QuadClusterSeparationY}
	    For K 2 {-QCWidthX/2 - QuadSeparationInClusterX/2} {QCWidthX + QuadSeparationInClusterX}
	        For L 2 {QCWidthY/2 + QuadSeparationInClusterY/2} {-QCWidthY - QuadSeparationInClusterY}
		    	QuadChip.Copy QuadChipA_%I_%J_%K_%L
		    	QuadChipA_%I_%J_%K_%L.Position {$I+$K} {$J+$L} QhadChipZ
		    	QuadChipA_%I_%J_%K_%L.Mother TrackerSegment
	        Done
	    Done
    Done
Done

For I 4 {-QuadClusterMaxX + QuadClusterSeparationX} QuadClusterSeparationX
	    For K 2 {-QCWidthX/2 - QuadSeparationInClusterX/2} {QCWidthX + QuadSeparationInClusterX}
		    	QuadChip.Copy QuadChipB_%I_5_%K_1
		    	QuadChipB_%I_5_%K_1.Position {$I+$K} {QuadClusterMaxY - 4*QuadClusterSeparationY + QCWidthY/2 + QuadSeparationInClusterY/2} QhadChipZ
		    	QuadChipB_%I_5_%K_1.Mother TrackerSegment
	    Done
Done

For I 3 {-QuadClusterMaxX + 2*QuadClusterSeparationX} QuadClusterSeparationX
	    For K 2 {-QCWidthX/2 - QuadSeparationInClusterX/2} {QCWidthX + QuadSeparationInClusterX}
		    	QuadChip.Copy QuadChipC_%I_5_%K_2
		    	QuadChipC_%I_5_%K_2.Position {$I+$K} {QuadClusterMaxY - 4*QuadClusterSeparationY - QCWidthY/2 - QuadSeparationInClusterY/2} QhadChipZ
		    	QuadChipC_%I_5_%K_2.Mother TrackerSegment
	    Done
Done

QuadChip.Copy QuadChipD_2_5_2_2
QuadChipD_2_5_2_2.Position {-QuadClusterMaxX + QuadClusterSeparationX + QCWidthX/2 + QuadSeparationInClusterX/2} {QuadClusterMaxY - 4*QuadClusterSeparationY - QCWidthY/2 - QuadSeparationInClusterY/2} QhadChipZ
QuadChipD_2_5_2_2.Mother TrackerSegment




#Add the FEE Board which consists of five separate rectangles. The size of these boards are based on the CAD model. 

Constant DistFrameBottomFEE 0.5529 
Constant DistFrameLeftFEE 0.5137 

Volume TrackerFEE1_1
TrackerFEE1_1.Shape BOX {9.1176/2} {10.6756/2-CornerBlocky} {FEEThickness/2}
TrackerFEE1_1.Material ComPairFEEBoard
TrackerFEE1_1.Visibility 1
TrackerFEE1_1.Color 3
TrackerFEE1_1.Position {-TrackerFrameBaseWidth/2 + DistFrameLeftFEE + 9.1176/2} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 10.6756/2 + CornerBlocky} FEEZ
TrackerFEE1_1.Mother TrackerSegment

Volume TrackerFEE1_2
TrackerFEE1_2.Shape BOX {9.1176/2-CornerBlockx/4} {CornerBlocky/2} {FEEThickness/2}
TrackerFEE1_2.Material ComPairFEEBoard
TrackerFEE1_2.Visibility 1
TrackerFEE1_2.Color 3
TrackerFEE1_2.Position {-TrackerFrameBaseWidth/2 + DistFrameLeftFEE + 9.1176/2 + CornerBlockx/4} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 3*CornerBlocky/2} FEEZ
TrackerFEE1_2.Mother TrackerSegment

Volume TrackerFEE1_3
TrackerFEE1_3.Shape BOX {9.1176/2-CornerBlockx/2} {CornerBlocky/2} {FEEThickness/2}
TrackerFEE1_3.Material ComPairFEEBoard
TrackerFEE1_3.Visibility 1
TrackerFEE1_3.Color 3
TrackerFEE1_3.Position {-TrackerFrameBaseWidth/2 + DistFrameLeftFEE + 9.1176/2 + CornerBlockx/2} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + CornerBlocky/2} FEEZ
TrackerFEE1_3.Mother TrackerSegment

Volume TrackerFEE2
TrackerFEE2.Shape BOX {4.3374/2} {6.4921/2} {FEEThickness/2} 
TrackerFEE2.Material ComPairFEEBoard
TrackerFEE2.Visibility 1
TrackerFEE2.Color 3
TrackerFEE2.Position {-TrackerFrameBaseWidth/2 + DistFrameLeftFEE + 9.1176 + 4.3374/2} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 6.4921/2} FEEZ 
TrackerFEE2.Mother TrackerSegment

Volume TrackerFEE3
TrackerFEE3.Shape BOX 14.5 {2.6776/2} {FEEThickness/2} 
TrackerFEE3.Material ComPairFEEBoard
TrackerFEE3.Visibility 1
TrackerFEE3.Color 3
TrackerFEE3.Position {-TrackerFrameBaseWidth/2 + DistFrameLeftFEE + 9.1176 + 4.3374 + 14.5} {-TrackerFrameBaseWidth/2 + DistFrameBottomFEE + 2.6776/2} FEEZ 
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
CornerBlockTop.Color  28 
CornerBlockTop.Material CarbonFiber


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
StandoffCross.Material CarbonFiber
StandoffCross.Visibility 1
StandoffCross.Color 61 

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
