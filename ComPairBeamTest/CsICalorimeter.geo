//____________//------------------//____________//
//____________//      CsI CAL     //____________//
//____________//------------------//____________//
//### Build 4 layers of 6 logs of CsI in hodoscopic configuration;
//### LOG: single log 10.0cm x 1.7cm x 1.7 cm aligned along the y direction.
//### TOWER: one tower of the CsI Detector 10.2x10.2x6.8
//### Fill The tower with 6 logs per layer (4 layers in total)

Volume CsILog
CsILog.Material CsI
CsILog.Visibility 1
CsILog.Color 42
CsILog.Shape BOX 5.1 0.85 0.85

Volume CsITower
CsITower.Material Vacuum
CsITower.Visibility 1
CsITower.Color 28
CsITower.Shape BRIK 5.1 5.1 3.4

For I 6 -4.25 1.7
    CsILog.Copy CsILog_y_%I_1
    CsILog_y_%I_1.Position 0.0 $I 2.55
    CsILog_y_%I_1.Mother CsITower
Done

For I 6 -4.25 1.7
    CsILog.Copy CsILog_x_%I_1
    CsILog_x_%I_1.Rotation 0 0 90
    CsILog_x_%I_1.Position $I 0.0 0.85
    CsILog_x_%I_1.Mother CsITower
Done

For I 6 -4.25 1.7
    CsILog.Copy CsILog_y_%I_2
    CsILog_y_%I_2.Position 0.0 $I -0.85
    CsILog_y_%I_2.Mother CsITower
Done

For I 6 -4.25 1.7
    CsILog.Copy CsILog_x_%I_2
    CsILog_x_%I_2.Rotation 0 0 90
    CsILog_x_%I_2.Position $I 0.0 -2.55
    CsILog_x_%I_2.Mother CsITower
Done

//------------------//