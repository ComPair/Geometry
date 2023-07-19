//Build the passive frame structure for a single layer of AstroPix detectors

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


Constant FEEThickness 0.157
Constant FrameThickness {1.5 - FEEThickness}
Constant WindowThickness 0.254

Volume TrackerFrame
TrackerFrame.Shape BOX 22.5 22.5 {FrameThickness/2}
TrackerFrame.Material Vacuum
TrackerFrame.Visibility 0
//TrackerFrame.Position 0 0 0
//TrackerFrame.Mother World

Volume FrameBase
FrameBase.Shape BOX 22.4 22.4 {WindowThickness/2}
FrameBase.Position 0 0 {FrameThickness/2 - WindowThickness/2}
FrameBase.Visibility 1
FrameBase.Color 4
FrameBase.Material M55J
FrameBase.Mother TrackerFrame

Volume QuadChipWindow
QuadChipWindow.Shape BOX 1.9 1.9 {WindowThickness/2}
QuadChipWindow.Material Vacuum
QuadChipWindow.Visibility 1
QuadChipWindow.Color 4

Include SiPixelSegment.geo

For I 5 {-QuadClusterMax} QuadClusterSeparation
    For J 5 {-QuadClusterMax} QuadClusterSeparation
	For K 2 {-APSWidth} {APSWidth*2}
	    For L 2 {-APSWidth} {APSWidth*2}
        	QuadChipWindow.Copy QuadChipWindow_%I_%J_%K_%L
        	QuadChipWindow_%I_%J_%K_%L.Position {$I+$K} {$J+$L} 0
        	QuadChipWindow_%I_%J_%K_%L.Mother FrameBase
	    Done
	Done
   Done
Done


Volume FrameEdgeLong
FrameEdgeLong.Shape BOX 0.05 22.5 {FrameThickness/2}
FrameEdgeLong.Material M55J

Volume FrameEdgeShort
FrameEdgeShort.Shape BOX 0.05 22.4 {FrameThickness/2}
FrameEdgeShort.Material M55J

FrameEdgeLong.Copy FrameEdgeLong1
FrameEdgeLong1.Position -22.45 0 0
FrameEdgeLong1.Rotation 0 0 0
FrameEdgeLong1.Mother TrackerFrame

FrameEdgeLong.Copy FrameEdgeLong2
FrameEdgeLong2.Position 22.45 0 0  
FrameEdgeLong2.Rotation 0 0 0
FrameEdgeLong2.Mother TrackerFrame

FrameEdgeShort.Copy FrameEdgeShort1
FrameEdgeShort1.Position 0 -22.45 0
FrameEdgeShort1.Rotation 0 0 90
FrameEdgeShort1.Mother TrackerFrame

FrameEdgeShort.Copy FrameEdgeShort2
FrameEdgeShort2.Position 0 22.45 0
FrameEdgeShort2.Rotation 0 0 90
FrameEdgeShort2.Mother TrackerFrame


