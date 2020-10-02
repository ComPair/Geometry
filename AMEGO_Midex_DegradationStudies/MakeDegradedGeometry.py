from os.path import basename, exists

def TurnOffOneTrackerLayerInOneTower( fileName, iLayer, tower = (1,1), nWafersPerRow = 4):

    with open(fileName, "a") as f:

        iTower, jTower = tower

        for iWafer in range(1,nWafersPerRow+1):
            for jWafer in range(1,nWafersPerRow+1):
                uniqueName = "SStrip_{}_{}_{}_{}_{}".format(iTower, jTower, iLayer, iWafer, jWafer)
                volumeName = "World.Tracker.SiStripDetector_{}_{}.SiStripTower.".format( iTower, jTower) \
                        + "PassiveFrame_{}_PassiveFrame_BigBlock_1.PassiveFrame_Hole_1.".format( iLayer ) \
                        + "SiStripLayer.Wafer_{}_{}".format( iWafer, jWafer )
                
                f.write( "SStrip.Named {}\n".format(uniqueName) )
                f.write( "{}.Assign {}\n".format(uniqueName, volumeName))
                f.write( "{}.EnergyResolution None\n\n".format( uniqueName))
             

def DegradeTracker( modes = None, tower = (1,1), inFile = "./AmegoBase.geo.setup", nTotalLayers = 40):
    
    trackerDegradationModes = {
        "TopHalfOff": range( nTotalLayers//2 + 1, nTotalLayers + 1 ),
        "BottomHalfOff": range( 1, nTotalLayers//2 + 1 ),
        "EvenOff": range( 2, nTotalLayers+1, 2 ),
        "OddOff": range( 1, nTotalLayers+1, 2 ), 
        "AllOff": range( 1, nTotalLayers+1 )
    }
    
    assert exists( inFile )
    
    name = basename( inFile ).replace(".geo", "").replace(".setup", "")

    if modes is None or modes == "all":
        modes = trackerDegradationModes.keys()
    
    elif type(modes) == str and modes in trackerDegradationModes.keys():
        modes = [ modes ]

    elif type( modes ) == dict:
        trackerDegradationModes = modes
        modes = trackerDegradationModes.keys()

    elif type( modes ) == list:
        pass
        
    else:
        print( "Unknown tracker degradation mode {}.".format(modes) )
        print( "Please specify one mode or a list of modes, or \"all\".")
        print( "Available modes: {}".format(list(trackerDegradationModes.keys()) ))


    for mode in modes:
        iLayers = trackerDegradationModes[mode]
        
        print( mode )
        
        outFile = "./{}_{}_{}_Tracker{}.geo.setup".format( name, tower[0], tower[1], mode )

        with open(outFile, "w") as f:
            f.write( "Include {}\n\n".format(inFile) )
    
        for iLayer in iLayers:
            TurnOffOneTrackerLayerInOneTower( outFile, iLayer, tower)

DegradeTracker( "all" )
