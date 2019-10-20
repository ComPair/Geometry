//____________//------------------//____________//
//____________//      CZT CAL     //____________//
//____________//------------------//____________//
//### BAR: Build a single CZT bar: 0.8x0.8x4 cm
//### BLOCK: Create the single segment of CZT, 2.5x2.5x2 cm
//### LAYER: Building single layer of 1 segment, 40x40x4.2 cm
//### Put 4x4 CZT bars into the block
//### Put 4x4 CZT blocks into the layer

Volume CZTBar
CZTBar.Visibility 1
CZTBar.Color 29
CZTBar.Material CZT
CZTBar.Shape BRIK 0.3 0.3 1.0

Volume CZTBlock
CZTBlock.Visibility 1
CZTBlock.Color 31
CZTBlock.Material Vacuum
CZTBlock.Shape BRIK 1.25 1.25 1.

Volume CZTLayer
CZTLayer.Material Vacuum
CZTLayer.Visibility 1
CZTLayer.Color 36
CZTLayer.Shape BRIK 5.0 5.0 1.

For I 4 -0.93 0.62
    For J 4 -0.93 0.62
    	CZTBar.Copy CZTBar_%I_%J
    	CZTBar_%I_%J.Position $I $J 0.0
    	CZTBar_%I_%J.Mother CZTBlock
    Done
Done

For I 4 -3.75 2.5
    For J 4 -3.75 2.5
    	CZTBlock.Copy CZTBlock_%I_%J
    	CZTBlock_%I_%J.Position $I $J 0.0
    	CZTBlock_%I_%J.Mother CZTLayer
    Done
Done

//------------------//