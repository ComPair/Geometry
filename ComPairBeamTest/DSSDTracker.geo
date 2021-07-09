//____________//------------------//____________//
//____________//     DSSD TKR     //____________//
//____________//------------------//____________//
//### WAFER: Build single wafer of Si Strips
//### TRACKER: Total volume of the tracker									
//### Tracker Volume, 10x10x10 cmcm							
//### Build One Si wafer, 10x10x0.05cm (active volume = 9.792 cm = 192 strips of 510 micron width)							
//### Add 10 wafer layers (containing wafer) to the tracker volume
								
Volume Tracker
Tracker.Material Vacuum
Tracker.Visibility 1
Tracker.Color 13
Tracker.Shape BRIK 5. 5. 9.05

Volume Wafer									
Wafer.Material Silicon								
Wafer.Visibility 1							
Wafer.Color 17									
Wafer.Shape BOX 4.896 4.896 0.025

For I 10 -8.55 1.9
    Wafer.Copy Wafer_%I
    Wafer_%I.Position 0.0 0.0 $I
    Wafer_%I.Mother Tracker
Done 

//------------------//
