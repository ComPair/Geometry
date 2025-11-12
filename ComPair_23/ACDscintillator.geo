//____________//------------------//____________//
//____________//        ACD       //____________//
//____________//------------------//____________//
//### Build the plastic scintillator all around the detector stack
//### BOX: just to fill it with the sensitive panels
//### 5 panels all around the sides of the tracker


//ComPair-1 ACD, but with an additional 2 cm width on ACD panels 1 and 3 in the Y direction to fit around ComPair-2


Volume ACDbox1
ACDbox1.Virtual true
ACDbox1.Material Vacuum
ACDbox1.Visibility 0
ACDbox1.Shape BOX 1.25 {26.55+2} 18.5

Volume ACDpanel1
ACDpanel1.Material EJ200
ACDpanel1.Visibility 1
ACDpanel1.Color 38
ACDpanel1.Shape BOX 0.75 {23.8+2} 17.5              
# 23.8 x 17.5 was 25.3 x 17.25
ACDpanel1.Position 0 0.75 0.75
ACDpanel1.Mother ACDbox1

Volume WLSbar1_1
WLSbar1_1.Material EJ200
WLSbar1_1.Visibility 1
WLSbar1_1.Color 3
WLSbar1_1.Shape BOX 0.75 0.75 17.5             
# 17.5
WLSbar1_1.Position 0 {-23.8-2} 0.75
WLSbar1_1.Mother ACDbox1

Volume WLSbar1_2
WLSbar1_2.Material EJ200
WLSbar1_2.Visibility 1
WLSbar1_2.Color 3
WLSbar1_2.Shape BOX 0.75 {23.8+2} 0.75               
# 23.8
WLSbar1_2.Position 0 0.75 -17.5
WLSbar1_2.Mother ACDbox1


Volume ACDbox2
ACDbox2.Virtual true
ACDbox2.Material Vacuum
ACDbox2.Visibility 0
ACDbox2.Shape BOX 34.55 1.25 18.5

Volume ACDpanel2
ACDpanel2.Material EJ200
ACDpanel2.Visibility 1
ACDpanel2.Color 38
ACDpanel2.Shape BOX 31.78 0.75 17.5              
# 31.78 x 17.5 was 33.3 x 17.25
ACDpanel2.Position 0.75 0 0.75
ACDpanel2.Mother ACDbox2

Volume WLSbar2_1
WLSbar2_1.Material EJ200
WLSbar2_1.Visibility 1
WLSbar2_1.Color 3
WLSbar2_1.Shape BOX 0.75 0.75 17.5              
# 17.5
WLSbar2_1.Position -31.78 0 0.75
WLSbar2_1.Mother ACDbox2

Volume WLSbar2_2
WLSbar2_2.Material EJ200
WLSbar2_2.Visibility 1
WLSbar2_2.Color 3
WLSbar2_2.Shape BOX 31.78 0.75 0.75               
# 31.78
WLSbar2_2.Position 0.75 0 -17.5
WLSbar2_2.Mother ACDbox2


Volume ACDbox3
ACDbox3.Virtual true
ACDbox3.Material Vacuum
ACDbox3.Visibility 0
ACDbox3.Shape BOX 1.25 {26.55+2} 18.5

Volume ACDpanel3
ACDpanel3.Material EJ200
ACDpanel3.Visibility 1
ACDpanel3.Color 38
ACDpanel3.Shape BOX 0.75 {23.8+2} 17.5                  
# 23.8 x 17.5 was 25.3 x 17.25
ACDpanel3.Position 0 -0.75 0.75
ACDpanel3.Mother ACDbox3

Volume WLSbar3_1
WLSbar3_1.Material EJ200
WLSbar3_1.Visibility 1
WLSbar3_1.Color 3
WLSbar3_1.Shape BOX 0.75 0.75 17.5                  
# 17.5 
WLSbar3_1.Position 0 {23.8+2} 0.75
WLSbar3_1.Mother ACDbox3

Volume WLSbar3_2
WLSbar3_2.Material EJ200
WLSbar3_2.Visibility 1
WLSbar3_2.Color 3
WLSbar3_2.Shape BOX 0.75 {23.8+2} 0.75                   
# 23.8
WLSbar3_2.Position 0 -0.75 -17.5
WLSbar3_2.Mother ACDbox3


Volume ACDbox4
ACDbox4.Virtual true
ACDbox4.Material Vacuum
ACDbox4.Visibility 0
ACDbox4.Shape BOX 34.55 1.25 18.5

Volume ACDpanel4
ACDpanel4.Material EJ200
ACDpanel4.Visibility 1
ACDpanel4.Color 38
ACDpanel4.Shape BOX 31.78 0.75 17.5           
# 31.78 x 17.5 was 33.3 x 17.25
ACDpanel4.Position -0.75 0 0.75
ACDpanel4.Mother ACDbox4

Volume WLSbar4_1
WLSbar4_1.Material EJ200
WLSbar4_1.Visibility 1
WLSbar4_1.Color 3
WLSbar4_1.Shape BOX 0.75 0.75 17.5           
# 17.5
WLSbar4_1.Position 31.78 0 0.75
WLSbar4_1.Mother ACDbox4

Volume WLSbar4_2
WLSbar4_2.Material EJ200
WLSbar4_2.Visibility 1
WLSbar4_2.Color 3
WLSbar4_2.Shape BOX 31.78 0.75 0.75            
# 31.78
WLSbar4_2.Position -0.75 0 -17.5
WLSbar4_2.Mother ACDbox4



Volume ACDbox5
ACDbox.Virtual true
ACDbox5.Material Vacuum
ACDbox5.Visibility 0
ACDbox5.Shape BOX 36.05 28.05 1.25

Volume ACDpanel5
ACDpanel5.Material EJ200
ACDpanel5.Visibility 1
ACDpanel5.Color 38
ACDpanel5.Shape BOX 34.141 26.161 0.75             
# 34.141 x 26.161 was 34.8 x 26.8
ACDpanel5.Position 0.75 0.75 0
ACDpanel5.Mother ACDbox5

//long in x direction
Volume WLSbar5_1
WLSbar5_1.Material EJ200
WLSbar5_1.Visibility 1
WLSbar5_1.Color 3
WLSbar5_1.Shape BOX 34.141 0.75 0.75            
# 34.141
WLSbar5_1.Position 0.75 -26.161 0
WLSbar5_1.Mother ACDbox5

// long in y direction
Volume WLSbar5_2
WLSbar5_2.Material EJ200
WLSbar5_2.Visibility 1
WLSbar5_2.Color 3
WLSbar5_2.Shape BOX 0.75 26.161 0.75            
# 26.161
WLSbar5_2.Position -34.141 0.75 0
WLSbar5_2.Mother ACDbox5

//Volume ACDtile
//ACDtile.Material EJ200
//ACDtile.Visibility 1
//ACDtile.Color 38
//ACDtile.Shape BOX 6. 6. 0.25
//ACDtile.Position 0.0 0.0 5.75
//ACDtile.Mother ACDbox

//ACDtile.Copy ACDtileSide1
//ACDtileSide1.Rotation 90 0 0
//ACDtileSide1.Position 0  -6.25 -0.5

//ACDtile.Copy ACDtileSide2
//ACDtileSide2.Rotation 90 0 0
//ACDtileSide2.Position 0  6.25 -0.5

//ACDtile.Copy ACDtileSide3
//ACDtileSide3.Rotation 0 90 0
//ACDtileSide3.Position -6.25  0 -0.5

//ACDtile.Copy ACDtileSide4
//ACDtileSide4.Rotation 0 90 0
//ACDtileSide4.Position 6.25  0 -0.5

//------------------//
