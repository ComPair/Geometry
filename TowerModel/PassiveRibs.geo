// Setup file for the ComPair prototype

// Include section
// NEEDS THIS LINE TO VIEW ALONE:
//Include ../materials/Materials.geo

//this assumes that the outter shell of the frame is 40x40 cm
//the wafers take up 38x38 cm


// The Mother Volume of the Detector Configuration:
Volume PassiveFrame_Volume
PassiveFrame_Volume.Material Vacuum
PassiveFrame_Volume.Visibility 0
PassiveFrame_Volume.Virtual true
PassiveFrame_Volume.Shape BRIK 40. 40. 75.
// NEEDS THIS LINE TO VIEW ALONE:
//PassiveFrame_Volume.Mother 0

// One big block from whish parts are cut away later (1)
Volume PassiveFrame_BigBlock_1
PassiveFrame_BigBlock_1.Material Peek
PassiveFrame_BigBlock_1.Shape BRIK 20. 20. 0.5 
PassiveFrame_BigBlock_1.Position 0 0 -0.25 
PassiveFrame_BigBlock_1.Color 1
PassiveFrame_BigBlock_1.Visibility 1
PassiveFrame_BigBlock_1.Mother PassiveFrame_Volume

// Cut out center block where 38.75x38.75 hold 38cm of wafers and 0.75 of passive ribs in 40x40 frame
Volume PassiveFrame_Hole_1
PassiveFrame_Hole_1.Material Vacuum
PassiveFrame_Hole_1.Shape BRIK  19.375 19.375 0.5
PassiveFrame_Hole_1.Position -0.25 -0.25 0
PassiveFrame_Hole_1.Color 1
PassiveFrame_Hole_1.Visibility 1
PassiveFrame_Hole_1.Mother PassiveFrame_BigBlock_1

// Build Y parts of frame
Volume PassiveFrame_Part_Y
PassiveFrame_Part_Y.Material Peek
PassiveFrame_Part_Y.Shape BRIK 0.125 19.375 0.125 
PassiveFrame_Part_Y.Color 1
PassiveFrame_Part_Y.Visibility 1

// Build X parts of frame
Volume PassiveFrame_Part_X
PassiveFrame_Part_X.Material Peek
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
        PassiveFrame_Part_Y%Y%X.Position $Y $X 0.125
        PassiveFrame_Part_Y%Y%X.Mother PassiveFrame_Hole_1
    Done       
Done   

//Loops to build X parts of frame
For X NYLayers YMax {-Xdist}
    For Y NXLayers XMax {-Ydist}
    	PassiveFrame_Part_X.Copy PassiveFrame_Part_X%Y%X
    	PassiveFrame_Part_X%Y%X.Position $Y $X -0.125
    	PassiveFrame_Part_X%Y%X.Mother PassiveFrame_Hole_1
    Done       
Done  

