////////////////////////////////////////////////////
// ComPair-2 Silicon Pixel Frame Geometry File
// Authors: Carolyn Kierans
// Version 2.0: 2025.06.06
// Version 1.0: 2023
// Description: Build the passive frame structure
// for a single layer of AstroPix detectors.
////////////////////////////////////////////////////
// Edited by Janeth Valverde and Carolyn Kierans
// on 2025.06.06
// - Updated constant, FrameBase & QuadChipWindow
// dimensions and created new constants.
// - Repositioned the QuadChipWindows (or cutouts)
//  to adequately represent the CAD assymetry.
// - Added FEE cutouts.
// - Adding bottom of standoffs and corner blocks
// here to avoid overlaps between segments.
////////////////////////////////////////////////////


/////Use these lines to run geometry as standalone

//SurroundingSphere 100.0  0.0  0.0  0.0  100.0
//Include ../materials/Materials.geo

//Volume World
//World.Material Vacuum
//World.Visibility 1
//World.Color 0
//World.Shape BRIK 500. 500. 500.
//World.Mother 0

///////

Constant SegmentThickness 1.5
Constant FEEThickness 0.2382 
Constant FrameThickness {SegmentThickness - FEEThickness}
Constant CompositeThickness 0.1524 
Constant TrackerFrameBaseWidth 45.182 

Volume TrackerFrame
TrackerFrame.Shape BOX {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} {FrameThickness/2} 
TrackerFrame.Material Vacuum
TrackerFrame.Visibility 1
TrackerFrame.Color 2
//Uncomment for standalone
//TrackerFrame.Position 0 0 0
//TrackerFrame.Mother World

Volume FrameBase
FrameBase.Shape BOX {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} {CompositeThickness/2}  
FrameBase.Position 0 0 {FrameThickness/2 - CompositeThickness/2}
FrameBase.Visibility 1
FrameBase.Color  11 
FrameBase.Material M55J
FrameBase.Mother TrackerFrame

Volume QuadChipWindow
QuadChipWindow.Shape BOX {3.533/2} {3.409/2} {CompositeThickness/2}
QuadChipWindow.Material Vacuum
QuadChipWindow.Visibility 1
QuadChipWindow.Color  1 

Include SiPixelSegment.geo


// QuadChip cutouts
Constant QuadClusterSeparationX 8.4317
Constant QuadClusterSeparationY 7.9983
Constant QuadClusterWidthX 7.876 
Constant QuadClusterWidthY 7.628 
Constant QuadSeparationInClusterX 0.01 
Constant QuadSeparationInClusterY 0.01 
Constant QuadClusterMaxX {TrackerFrameBaseWidth/2 - 1.7501 - QuadClusterWidthX/2}
Constant QuadClusterMaxY {TrackerFrameBaseWidth/2 - 1.7796 - QuadClusterWidthY/2} // Baricenter of 5x5 quad chip cluster at (7.9983x4+7.628)/2+1.7796 from frame top in Y == y=-1,0008. Remember that the Baricenter of the Frame, and any Mother volume is taken to be the origin.

For I 5 {-QuadClusterMaxX} QuadClusterSeparationX
    For J 4 {QuadClusterMaxY} {-QuadClusterSeparationY}
	    For K 2 {-QCWidthX/2 - QuadSeparationInClusterX/2} {QCWidthX + QuadSeparationInClusterX}
	        For L 2 {QCWidthY/2 + QuadSeparationInClusterY/2} {-QCWidthY - QuadSeparationInClusterY}
		    	QuadChipWindow.Copy QuadChipWindow_%I_%J_%K_%L
		    	QuadChipWindow_%I_%J_%K_%L.Position {$I+$K} {$J+$L} 0
		    	QuadChipWindow_%I_%J_%K_%L.Mother FrameBase
	        Done
	    Done
    Done
Done

For I 4 {-QuadClusterMaxX + QuadClusterSeparationX} QuadClusterSeparationX
	    For K 2 {-QCWidthX/2 - QuadSeparationInClusterX/2} {QCWidthX + QuadSeparationInClusterX}
		    	QuadChipWindow.Copy QuadChipWindow_%I_5_%K_1
		    	QuadChipWindow_%I_5_%K_1.Position {$I+$K} {QuadClusterMaxY - 4*QuadClusterSeparationY + QCWidthY/2 + QuadSeparationInClusterY/2} 0
		    	QuadChipWindow_%I_5_%K_1.Mother FrameBase
	    Done
Done

For I 3 {-QuadClusterMaxX + 2*QuadClusterSeparationX} QuadClusterSeparationX
	    For K 2 {-QCWidthX/2 - QuadSeparationInClusterX/2} {QCWidthX + QuadSeparationInClusterX}
		    	QuadChipWindow.Copy QuadChipWindow_%I_5_%K_2
		    	QuadChipWindow_%I_5_%K_2.Position {$I+$K} {QuadClusterMaxY - 4*QuadClusterSeparationY - QCWidthY/2 - QuadSeparationInClusterY/2} 0
		    	QuadChipWindow_%I_5_%K_2.Mother FrameBase
	    Done
Done

QuadChipWindow.Copy QuadChipWindowD_2_5_2_2
QuadChipWindowD_2_5_2_2.Position {-QuadClusterMaxX + QuadClusterSeparationX + QCWidthX/2 + QuadSeparationInClusterX/2} {QuadClusterMaxY - 4*QuadClusterSeparationY - QCWidthY/2 - QuadSeparationInClusterY/2} 0
QuadChipWindowD_2_5_2_2.Mother FrameBase


// FEE cutouts
Volume FEECutOut_1
FEECutOut_1.Shape BOX {6.597/2} {6.726/2} {CompositeThickness/2}
FEECutOut_1.Material Vacuum
FEECutOut_1.Visibility 1
FEECutOut_1.Color  1 
FEECutOut_1.Position {-TrackerFrameBaseWidth/2 + 1.9 + 6.597/2} {-TrackerFrameBaseWidth/2 + 2.5 + 6.726/2} 0 
FEECutOut_1.Mother FrameBase

Volume FEECutOut_2
FEECutOut_2.Shape BOX {3.266/2} {5.191/2} {CompositeThickness/2}
FEECutOut_2.Material Vacuum
FEECutOut_2.Visibility 1
FEECutOut_2.Color  1 
FEECutOut_2.Position {-TrackerFrameBaseWidth/2 + 9.8 + 3.266/2} {-TrackerFrameBaseWidth/2 + 1.2 + 5.191/2} 0 
FEECutOut_2.Mother FrameBase



// Frame side walls
Volume FrameEdgeLong
FrameEdgeLong.Shape BOX {CompositeThickness/2} {TrackerFrameBaseWidth/2} {FrameThickness/2-CompositeThickness/2}
FrameEdgeLong.Material M55J

Volume FrameEdgeShort
FrameEdgeShort.Shape BOX {CompositeThickness/2} {TrackerFrameBaseWidth/2-CompositeThickness} {FrameThickness/2-CompositeThickness/2}
FrameEdgeShort.Material M55J

FrameEdgeLong.Copy FrameEdgeLong1
FrameEdgeLong1.Position {-TrackerFrameBaseWidth/2 + CompositeThickness/2} 0 {-CompositeThickness/2}  
FrameEdgeLong1.Rotation 0 0 0
FrameEdgeLong1.Mother TrackerFrame

FrameEdgeLong.Copy FrameEdgeLong2
FrameEdgeLong2.Position {TrackerFrameBaseWidth/2 - CompositeThickness/2} 0 {-CompositeThickness/2}  
FrameEdgeLong2.Rotation 0 0 0
FrameEdgeLong2.Mother TrackerFrame

FrameEdgeShort.Copy FrameEdgeShort1
FrameEdgeShort1.Position 0 {-TrackerFrameBaseWidth/2 + CompositeThickness/2} {-CompositeThickness/2} 
FrameEdgeShort1.Rotation 0 0 90
FrameEdgeShort1.Mother TrackerFrame

FrameEdgeShort.Copy FrameEdgeShort2
FrameEdgeShort2.Position 0 {TrackerFrameBaseWidth/2 - CompositeThickness/2} {-CompositeThickness/2} 
FrameEdgeShort2.Rotation 0 0 90
FrameEdgeShort2.Mother TrackerFrame






//Bottom half of standoff under the frame: Outer diameter average = 4.762mm, Inner diameter = 3.175mm
Constant StandoffInnerD 0.318
Constant StandoffOuterD 0.476
Constant StandoffHeightBeneathFrame 1.063
Constant Standoffx1 9.942
Constant Standoffx2 18.374
Constant Standoffx3 26.806
Constant Standoffx4 35.238
Constant Standoffy1 11.595
Constant Standoffy2 19.593
Constant Standoffy3 27.590
Constant Standoffy4 35.589

//Material should be G10, but it seems the roTMM3 is a good approximation. Couldn't find any specifics about the resin composition.

Volume FrameStandoffsCylindar 
FrameStandoffsCylindar.Shape TUBS {StandoffInnerD/2} {StandoffOuterD/2} {StandoffHeightBeneathFrame/2} 0 360
FrameStandoffsCylindar.Material roTMM3
FrameStandoffsCylindar.Visibility 1
FrameStandoffsCylindar.Color 61 

FrameStandoffsCylindar.Copy FrameStandoffsCylindar1
FrameStandoffsCylindar1.Position {-TrackerFrameBaseWidth/2 + Standoffx1} {-TrackerFrameBaseWidth/2 + Standoffy1} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2} 
FrameStandoffsCylindar1.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar2
FrameStandoffsCylindar2.Position {-TrackerFrameBaseWidth/2 + Standoffx4} {-TrackerFrameBaseWidth/2 + Standoffy1} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar2.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar3
FrameStandoffsCylindar3.Position {-TrackerFrameBaseWidth/2 + Standoffx2} {-TrackerFrameBaseWidth/2 + Standoffy2} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar3.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar4
FrameStandoffsCylindar4.Position {-TrackerFrameBaseWidth/2 + Standoffx3} {-TrackerFrameBaseWidth/2 + Standoffy2} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar4.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar5
FrameStandoffsCylindar5.Position {-TrackerFrameBaseWidth/2 + Standoffx2} {-TrackerFrameBaseWidth/2 + Standoffy3} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar5.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar6
FrameStandoffsCylindar6.Position {-TrackerFrameBaseWidth/2 + Standoffx3} {-TrackerFrameBaseWidth/2 + Standoffy3} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar6.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar7
FrameStandoffsCylindar7.Position {-TrackerFrameBaseWidth/2 + Standoffx1} {-TrackerFrameBaseWidth/2 + Standoffy4} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar7.Mother TrackerFrame

FrameStandoffsCylindar.Copy FrameStandoffsCylindar8
FrameStandoffsCylindar8.Position {-TrackerFrameBaseWidth/2 + Standoffx4} {-TrackerFrameBaseWidth/2 + Standoffy4} {FrameThickness/2 - CompositeThickness - StandoffHeightBeneathFrame/2}
FrameStandoffsCylindar8.Mother TrackerFrame


//The very bottom of the corner block is included on the top of the tray
Constant CornerBlockx 1.905
Constant CornerBlocky 1.016
Constant CornerBlockHeight {FrameThickness/2 - CompositeThickness/2}

Shape BOX CornerBlockSub1
CornerBlockSub1.Parameters {CornerBlockx/2} {CornerBlocky/2} CornerBlockHeight

Shape BOX CornerBlockSub2
CornerBlockSub2.Parameters {CornerBlockx/2} {CornerBlocky/2} CornerBlockHeight

Orientation CornerBlockOrientation
CornerBlockOrientation.Position {-CornerBlockx/2 + CornerBlocky/2} {CornerBlocky/2 - CornerBlockx/2} 0
CornerBlockOrientation.Rotation 0 0 90

Shape Union CornerBlockShape
CornerBlockShape.Parameters CornerBlockSub1 CornerBlockSub2 CornerBlockOrientation

Volume CornerBlock
CornerBlock.Shape CornerBlockShape
CornerBlock.Visibility 1
CornerBlock.Color  28 
CornerBlock.Material roTMM3


CornerBlock.Copy CornerBlock1
CornerBlock1.Position {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlockx/2} {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlocky/2} {-CompositeThickness/2} 
CornerBlock1.Mother TrackerFrame

CornerBlock.Copy CornerBlock2
CornerBlock2.Position {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlocky/2} {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlockx/2} {-CompositeThickness/2} 
CornerBlock2.Rotation 0 0 90
CornerBlock2.Mother TrackerFrame

CornerBlock.Copy CornerBlock3
CornerBlock3.Position {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlockx/2} {-TrackerFrameBaseWidth/2 + CompositeThickness + CornerBlocky/2} {-CompositeThickness/2} 
CornerBlock3.Rotation 0 0 180
CornerBlock3.Mother TrackerFrame

CornerBlock.Copy CornerBlock4
CornerBlock4.Position {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlocky/2} {TrackerFrameBaseWidth/2 - CompositeThickness - CornerBlockx/2} {-CompositeThickness/2} 
CornerBlock4.Rotation 0 0 270
CornerBlock4.Mother TrackerFrame



