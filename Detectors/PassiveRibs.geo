// Setup file for the AMEGO prototype

//this assumes that the outter shell of the frame is 45x45 cm
//the wafers take up 38x38 cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

// The Mother Volume of the Detector Configuration:
Volume PassiveFrame_Volume
PassiveFrame_Volume.Material Vacuum
PassiveFrame_Volume.Visibility 0
PassiveFrame_Volume.Virtual true
PassiveFrame_Volume.Shape BRIK 45. 45. 75.
// NEEDS THIS LINE TO VIEW ALONE:
//PassiveFrame_Volume.Mother 0

// One big block from whish parts are cut away later (1)
Volume PassiveFrame_BigBlock_1
PassiveFrame_BigBlock_1.Material Peek
PassiveFrame_BigBlock_1.Shape BRIK 22.5 22.5 0.5 
PassiveFrame_BigBlock_1.Position 0 0 -0.25 
PassiveFrame_BigBlock_1.Color 1
PassiveFrame_BigBlock_1.Visibility 1
PassiveFrame_BigBlock_1.Mother PassiveFrame_Volume

// Cut out center block where 38.75x38.75 hold 38cm of wafers and 0.75 of passive ribs in 40x40 frame 19.375
Volume PassiveFrame_Hole_1
PassiveFrame_Hole_1.Material Vacuum
PassiveFrame_Hole_1.Shape BRIK  19.5 19.5 0.5
PassiveFrame_Hole_1.Position -2.5 -2.5 0
PassiveFrame_Hole_1.Color 1
PassiveFrame_Hole_1.Visibility 1
PassiveFrame_Hole_1.Mother PassiveFrame_BigBlock_1

// Cut out some material on the sides of the block frame
Volume PassiveFrame_Hole_2
PassiveFrame_Hole_2.Material Vacuum
PassiveFrame_Hole_2.Shape BRIK  19.5 2.25 0.125
PassiveFrame_Hole_2.Position  -2.5 19.5 0.375
PassiveFrame_Hole_2.Color 1
PassiveFrame_Hole_2.Visibility 1
PassiveFrame_Hole_2.Mother PassiveFrame_BigBlock_1

Volume PassiveFrame_Hole_3
PassiveFrame_Hole_3.Material Vacuum
PassiveFrame_Hole_3.Shape BRIK  19.5 2.25 0.125
PassiveFrame_Hole_3.Position -2.5 19.5 -0.375
PassiveFrame_Hole_3.Color 1
PassiveFrame_Hole_3.Visibility 1
PassiveFrame_Hole_3.Mother PassiveFrame_BigBlock_1

Volume PassiveFrame_Hole_4
PassiveFrame_Hole_4.Material Vacuum
PassiveFrame_Hole_4.Shape BRIK  2.25 19.5 0.125
PassiveFrame_Hole_4.Position  19.5 -2.5 0.375
PassiveFrame_Hole_4.Color 1
PassiveFrame_Hole_4.Visibility 1
PassiveFrame_Hole_4.Mother PassiveFrame_BigBlock_1

Volume PassiveFrame_Hole_5
PassiveFrame_Hole_5.Material Vacuum
PassiveFrame_Hole_5.Shape BRIK  2.25 19.5 0.125
PassiveFrame_Hole_5.Position 19.5 -2.5 -0.375
PassiveFrame_Hole_5.Color 1
PassiveFrame_Hole_5.Visibility 1
PassiveFrame_Hole_5.Mother PassiveFrame_BigBlock_1


// Build Y parts of frame
Volume PassiveFrame_Part_Y
PassiveFrame_Part_Y.Material Peek
#PassiveFrame_Part_Y.Material Vacuum
PassiveFrame_Part_Y.Shape BRIK 0.125 19.375 0.125
PassiveFrame_Part_Y.Color 1
PassiveFrame_Part_Y.Visibility 1

// Build X parts of frame
Volume PassiveFrame_Part_X
PassiveFrame_Part_X.Material Peek
#PassiveFrame_Part_X.Material Vacuum
PassiveFrame_Part_X.Shape BRIK 19.375 0.125 0.125
PassiveFrame_Part_X.Color 1
PassiveFrame_Part_X.Visibility 1

Constant NYLayers 3
Constant YMax 9.875
Constant Ydist 9.75
Constant NXLayers 1
Constant XMax 0
Constant Xdist 9.75


//Loops to build Y parts of frame
For Y NYLayers YMax {-Ydist}
    For X NXLayers XMax {-Xdist}
        PassiveFrame_Part_Y.Copy PassiveFrame_Part_Y%Y%X
        PassiveFrame_Part_Y%Y%X.Position $Y $X 0.15
        PassiveFrame_Part_Y%Y%X.Mother PassiveFrame_Hole_1
    Done       
Done   

//Loops to build X parts of frame
For X NYLayers YMax {-Xdist}
    For Y NXLayers XMax {-Ydist}
    	PassiveFrame_Part_X.Copy PassiveFrame_Part_X%Y%X
    	PassiveFrame_Part_X%Y%X.Position $Y $X -0.15
    	PassiveFrame_Part_X%Y%X.Mother PassiveFrame_Hole_1
    Done       
Done  

