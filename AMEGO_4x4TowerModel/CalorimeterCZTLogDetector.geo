//Building the CZT detector total 50x50x4 cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCZTLogLayer.geo

//Building single layer of 1 segment, 40x40x4.2 cm
Volume CZTLayer
CZTLayer.Material Vacuum
CZTLayer.Visibility 0
CZTLayer.Shape BRIK 20.0 20.0 2.1

// Put the CZT segments into the layer
For I 8 -17.5 5.
    For J 8 -17.5 5.
    	CZTSegment.Copy CZTSegment_%I_%J
    	CZTSegment_%I_%J.Position $I $J 0.0
    	CZTSegment_%I_%J.Mother CZTLayer
    Done
Done

//Adds the segment to build the detector
Volume CZTLogDetector
CZTLogDetector.Material Vacuum
CZTLogDetector.Visibility 0
CZTLogDetector.Shape BRIK 20.0 20.0 2.1
// Include this to run in stand-alone
//CZTLogDetector.Mother 0

CZTLayer.Mother CZTLogDetector

//Building single side layer of 1 segment, 75 cm x 20 cm x 4 cm 
//This eventually will get rotated to be the side calorimeter
Volume CZTSideLayer
CZTSideLayer.Material Vacuum
CZTSideLayer.Visibility 1
CSTSideLayer.Color 2
// Include this to run in stand-alone
//CZTSideLayer.Mother 0

If {NLayers < 50} // Workaround for bug in Geomega where setting NLayers to zero would cause an exception in the for loop. Instead, set NLayers above 50 to disable sideCZT
    CZTSideLayer.Shape BRIK 37.5 {2.5*NLayers} 2.1
    //Adds the segments to build the side layer
    For I 15 -35. 5.
        For J {NLayers} -7.5 5. // Increase NLayers to increase height
            CZTSideSegment.Copy CZTSideSegment_%I_%J
            CZTSideSegment_%I_%J.Position $I {$J-2.5*(NLayers-4)} 0
            CZTSideSegment_%I_%J.Mother CZTSideLayer
        Done
    Done
EndIf
If {NLayers > 50}
    CZTSideLayer.Shape BRIK 37.5 2.5 2.1
EndIf
