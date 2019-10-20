//____________//------------------//____________//
//____________//     DSSD TKR     //____________//
//____________//------------------//____________//
//### WAFER: Build single wafer of Si Strips
//### LARYER: Build single layer containing 1 wafer (same wafer dimensions)	
//### TRACKER: Total volume of the tracker									
//### Tracker Volume, 10x10x10 cmcm							
//### Build One Layer of the TKR, 9.5x9.5x0.05 cm	
//### Build One Si wafer, 9.5x9.5x0.05cm							
//### Add 10 layers (containing wafer) to the tracker volume
								
Volume Tracker
Tracker.Material Vacuum
Tracker.Visibility 1
Tracker.Color 9
Tracker.Shape BRIK 5. 5. 5.

Volume SiStripLayer 
SiStripLayer.Material Vacuum
SiStripLayer.Visibility 0
SiStripLayer.Shape BOX 4.75 4.75 0.025 

Volume Wafer									
Wafer.Material Silicon								
Wafer.Visibility 1								
Wafer.Color 38									
Wafer.Shape BOX 4.75 4.75 0.025
Wafer.Mother SiStripLayer

For I 10 -4.5 1.0
    SiStripLayer.Copy SiStripLayer_%I
    SiStripLayer_%I.Position 0.0 0.0 $I
    //Print %I $I   
    SiStripLayer_%I.Mother Tracker
Done 

//------------------//




































































































