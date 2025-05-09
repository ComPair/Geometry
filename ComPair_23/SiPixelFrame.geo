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


