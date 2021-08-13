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


//This builds the ACD Detector totally made up numbers: 129.5cm x 129.5cm x 73cm
Volume MMS
MMS.Material Vacuum
MMS.Visibility 0
MMS.Color 9
MMS.Shape BRIK 72.5 72.5 48
// Include this to run stand-alone
//MMS.Mother World

Volume MMSTop
MMSTop.Material MMSMaterial
MMSTop.Visibility 1
MMSTop.Color 11
MMSTop.Shape BRIK 72.5 72.5 2.15
MMSTop.Position 0. 0. {48 - 2.15}
MMSTop.Mother MMS


Volume SideMMSShort
SideMMSShort.Material MMSMaterial
SideMMSShort.Visibility 1
SideMMSShort.Color 11
SideMMSShort.Shape BRIK {72.5 - 2.15*2} 2.15 {48 - 2.15} 

For I 2 {-72.5 + 2.15} 140.7
    SideMMSShort.Copy SideMMSShort_%I
    SideMMSShort_%I.Position $I 0 {-2.15}
    SideMMSShort_%I.Rotation 0 0 90
    SideMMSShort_%I.Mother MMS
Done

Volume SideMMSLong
SideMMSLong.Material MMSMaterial
SideMMSLong.Visibility 1
SideMMSLong.Color 11
SideMMSLong.Shape BRIK {72.5} 2.15 {48 - 2.15} 

For I 2 {-72.5 + 2.15} 140.7
    SideMMSLong.Copy SideMMSLong_%I
    SideMMSLong_%I.Position 0 $I {-2.15}
    SideMMSLong_%I.Mother MMS
Done


