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
CsILog.Shape BOX 0.85 0.85 5.1

Volume CsILayer
CsILayer.Material Vacuum
CsILayer.Visibility 0
CsILayer.Shape BOX 0.85 5.1 5.1

Volume CsITower
CsITower.Material Vacuum
CsITower.Visibility 0
CsITower.Color 28
CsITower.Shape BRIK 5.1 5.1 3.4

For I 6 -4.25 1.7
    CsILog.Copy CsILog_%I
    CsILog_%I.Position 0.0 $I 0.0
    CsILog_%I.Mother CsILayer
Done

For I 4 -2.55 1.7
    CsILayer.Copy CsILayer_%I
    CsILayer_%I.Rotation 0 90 0
    CsILayer_%I.Position 0.0 0.0 $I
    CsILayer_2.Rotation 0 90 90  
    CsILayer_4.Rotation 0 90 90
    CsILayer_%I.Mother CsITower 
Done 

//------------------//