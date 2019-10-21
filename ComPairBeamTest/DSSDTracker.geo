//____________//------------------//____________//
//____________//     DSSD TKR     //____________//
//____________//------------------//____________//
//### WAFER: Build single wafer of Si Strips
//### TRACKER: Total volume of the tracker									
//### Tracker Volume, 10x10x10 cmcm							
//### Build One Si wafer, 9.5x9.5x0.05cm							
//### Add 10 wafer layers (containing wafer) to the tracker volume
								
Volume Tracker
Tracker.Material Vacuum
Tracker.Visibility 1
Tracker.Color 13
Tracker.Shape BRIK 5. 5. 5.

Volume Wafer									
Wafer.Material Silicon								
Wafer.Visibility 1							
Wafer.Color 17									
Wafer.Shape BOX 4.75 4.75 0.025

For I 10 -4.5 1.0
    Wafer.Copy Wafer_%I
    Wafer_%I.Position 0.0 0.0 $I
    Wafer_%I.Mother Tracker
Done 

//------------------//