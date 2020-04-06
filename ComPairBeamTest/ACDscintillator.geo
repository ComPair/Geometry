//____________//------------------//____________//
//____________//        ACD       //____________//
//____________//------------------//____________//
//### Build the plastic scintillator all around the tracker;
//### TILE: single ACD tile (TBD: 7.x7.x0.5) cm
//### BOX: just to fill it with the sensitive tiles 
//### 5 tiles all around the sides of the tracker

Volume ACDbox
ACDbox.Material Vacuum
ACDbox.Visibility 0
ACDbox.Shape BOX 6. 6. 6.

Volume ACDtile
ACDtile.Material PEN
ACDtile.Visibility 1
ACDtile.Color 38
ACDtile.Shape BOX 6. 6. 0.25
ACDtile.Position 0.0 0.0 5.75
ACDtile.Mother ACDbox

ACDtile.Copy ACDtileSide1
ACDtileSide1.Rotation 90 0 0
ACDtileSide1.Position 0  -6.25 -0.5

ACDtile.Copy ACDtileSide2
ACDtileSide2.Rotation 90 0 0
ACDtileSide2.Position 0  6.25 -0.5

ACDtile.Copy ACDtileSide3
ACDtileSide3.Rotation 0 90 0
ACDtileSide3.Position -6.25  0 -0.5

ACDtile.Copy ACDtileSide4
ACDtileSide4.Rotation 0 90 0
ACDtileSide4.Position 6.25  0 -0.5

//------------------//