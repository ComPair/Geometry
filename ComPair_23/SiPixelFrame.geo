//Build the passive frame structure for a single layer of AstroPix detectors

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

Constant SegmentThickness 1.5 // J: New constant
Constant FEEThickness 0.2382 // J: Before 0.157
Constant FrameThickness {SegmentThickness - FEEThickness}
Constant CompositeThickness 0.1524 // J: Before 0.254 M55J
Constant TrackerFrameBaseWidth 45.182 // J: New constant

Volume TrackerFrame
TrackerFrame.Shape BOX {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} {FrameThickness/2} // J: Before 22.5 22.5 {FrameThickness/2}
TrackerFrame.Material Vacuum
TrackerFrame.Visibility 1
TrackerFrame.Color 2
//Uncomment for standalone
//TrackerFrame.Position 0 0 0
//TrackerFrame.Mother World

Volume FrameBase
FrameBase.Shape BOX {TrackerFrameBaseWidth/2} {TrackerFrameBaseWidth/2} {CompositeThickness/2} // J: Before 22.4 22.4 {CompositeThickness/2} 
FrameBase.Position 0 0 {FrameThickness/2 - CompositeThickness/2}
FrameBase.Visibility 1
FrameBase.Color 4
FrameBase.Material M55J
FrameBase.Mother TrackerFrame

Volume QuadChipWindow
QuadChipWindow.Shape BOX {3.533/2} {3.409/2} {CompositeThickness/2}// J: From CAD. Before 1.9 1.9 {CompositeThickness/2}
QuadChipWindow.Material Vacuum
QuadChipWindow.Visibility 1
QuadChipWindow.Color 4

Include SiPixelSegment.geo

// New
//BeginComment
Constant QuadClusterSeparationX 8.4317
Constant QuadClusterSeparationY 7.9983
Constant QuadClusterWidthX 7.876 // J: New constant
Constant QuadClusterWidthY 7.628 // J: New constant
Constant QuadSeparationInClusterX 0.01 // J: New constant
Constant QuadSeparationInClusterY 0.01 // J: New constant
Constant QuadClusterMaxX {TrackerFrameBaseWidth/2 - 1.7501 - QuadClusterWidthX/2}
Constant QuadClusterMaxY {TrackerFrameBaseWidth/2 - 1.7796 - QuadClusterWidthY/2} // J: Baricenter of 5x5 quiad chip cluster at (7.9983x4+7.628)/2+1.7796 from frame top in Y == y=-1,0008. Remember that the Baricenter of the Frame, and any Mother volume is taken to be the origin.

For I 5 {-QuadClusterMaxX} QuadClusterSeparationX
    For J 5 {QuadClusterMaxY} {-QuadClusterSeparationY}
	    For K 2 {-QuadChipWidthX/2 - QuadSeparationInClusterX/2} {QuadChipWidthX + QuadSeparationInClusterX}
	        For L 2 {QuadChipWidthY/2 + QuadSeparationInClusterY/2} {-QuadChipWidthY - QuadSeparationInClusterY}
		    	QuadChipWindow.Copy QuadChipWindow_%I_%J_%K_%L
		    	QuadChipWindow_%I_%J_%K_%L.Position {$I+$K} {$J+$L} 0
		    	QuadChipWindow_%I_%J_%K_%L.Mother FrameBase
	        Done
	    Done
    Done
Done

//EndComment

////
//For I 5 {-QuadClusterMax} QuadClusterSeparation
//    For J 5 {-QuadClusterMax} QuadClusterSeparation
//	For K 2 {-APSWidth} {APSWidth*2}
//	    For L 2 {-APSWidth} {APSWidth*2}
//        	QuadChipWindow.Copy QuadChipWindow_%I_%J_%K_%L
//        	QuadChipWindow_%I_%J_%K_%L.Position {$I+$K} {$J+$L} 0
//        	QuadChipWindow_%I_%J_%K_%L.Mother FrameBase
//	    Done
//	Done
//   Done
//Done
////


Volume FrameEdgeLong
FrameEdgeLong.Shape BOX {CompositeThickness/2} {TrackerFrameBaseWidth/2} {FrameThickness/2-CompositeThickness/2}// J: Before 0.05 22.5 {FrameThickness/2}
FrameEdgeLong.Material M55J

Volume FrameEdgeShort
FrameEdgeShort.Shape BOX {CompositeThickness/2} {TrackerFrameBaseWidth/2-CompositeThickness} {FrameThickness/2-CompositeThickness/2}// J: Before  0.05 22.4 {FrameThickness/2}
FrameEdgeShort.Material M55J

FrameEdgeLong.Copy FrameEdgeLong1
FrameEdgeLong1.Position {-TrackerFrameBaseWidth/2 + CompositeThickness/2} 0 {-CompositeThickness/2} // J: Before -22.45 0 0 
FrameEdgeLong1.Rotation 0 0 0
FrameEdgeLong1.Mother TrackerFrame

FrameEdgeLong.Copy FrameEdgeLong2
FrameEdgeLong2.Position {TrackerFrameBaseWidth/2 - CompositeThickness/2} 0 {-CompositeThickness/2} // J: Before 22.45 0 0 
FrameEdgeLong2.Rotation 0 0 0
FrameEdgeLong2.Mother TrackerFrame

FrameEdgeShort.Copy FrameEdgeShort1
FrameEdgeShort1.Position 0 {-TrackerFrameBaseWidth/2 + CompositeThickness/2} {-CompositeThickness/2} // J: Before 0 -22.45 0
FrameEdgeShort1.Rotation 0 0 90
FrameEdgeShort1.Mother TrackerFrame

FrameEdgeShort.Copy FrameEdgeShort2
FrameEdgeShort2.Position 0 {TrackerFrameBaseWidth/2 - CompositeThickness/2} {-CompositeThickness/2} // J: Before 0 22.45 0
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
FrameStandoffsCylindar.Color 2

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
CornerBlock.Color 2
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



