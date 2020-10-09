#!/usr/bin/env python
"""
------------------------------------------------------------------------

A script to generate 'degraded' detector configuration files where some detector components are turned off.

This is meant to simulate a situation in which e.g. we lost power to (or readout of) half of the tracker layers in one tower.

"Turning off" is achieved by setting the energy resolution to "None".

To turn off only part of the tracker, we need to assign "named detectors" to the affected parts. Named detectors can only be assigned to single wafers, so we need 4*4=16 named detectors (one for each wafer) for each layer that is to be turned off.

The AMEGO_Midex geometry has 2*2=4 towers, labeled as (1,1), (1,2), (2,1), (2,2), each with 40 layers consisting of 4*4 wafers each.

Currently, 5 modes are supported: turning off one entire tracker tower, the top half, the bottom half, or every other layer (even/odd). Other modes can be easily added to the code or at runtime.

To avoid duplication, the input geo setup file specifying the detector geometry is not copied, but rather included, in the files created here. This means that they need to be in the same directory as the original file for the include statements to work.

Calling "python MakeDegradedGeometry.py" will by default generate 5 output files, one for each mode specified above, for tower (1,1) in the file "AmegoBase.geo.setup". To change these defaults, use

import MakeDegradedGeometry
DegradeTracker( ... )

with whatever options you want.

Custom modes can be implemented as a pair of a string and a list (of affected layers) like this:

myModes = {
    "OneAndSeven": [1, 7],
    "EveryThirdOff": range( 1, nTotalLayers+1, 3 )
}

DegradeTracker( myModes )

Notes: Currently, only one tower at a time can be specified.

Removing calorimeter layers can be implemented in a similar way (segment by segment).

------------------------------------------------------------------------
"""


from os.path import basename, exists
import random
import string

def TurnOffOneTrackerLayerInOneTower( fileName, iLayer, tower = (1,1), nWafersPerRow = 4):
    """
    Function to generate one named detectors for each wafer in a given tower/layer & set their energy resolution to None.
    fileName: name of output file. Commands to disable the layer are appended.
    iLayer: layer to be disabled. Count starts at 1.
    tower: Tower in which the layer is to be disabled. (1,1), (1,2), (2,1), or (2,2) for the 2x2 AMEGO.
    nWafersPerRow: Number of wafers per row in layer. Layer is assumed to be square.
    """

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
        "AllOff": range( 1, nTotalLayers+1 ),
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


def DegradeTrackerRandomly( nLayersToTurnOff, seedString, towers=[(1,1)], inFile = "./AmegoBase.geo.setup", nTotalLayers = 40, nTotalTowers = (2,2)):

    assert exists( inFile )
    
    name = basename( inFile ).replace(".geo", "").replace(".setup", "")

    #select layers from all towers
    if towers == None:
    
        towers = []
        for i in range(1, nTotalTowers[0]+1):
            for j in range(1, nTotalTowers[1]+1):
                towers.append( (i,j) )
    
        outFile = "./{}_All_TrackerRandom_{}_{}.geo.setup".format( name, nLayersToTurnOff, seedString )
    
    else:
        outFile = "./{}_{}_{}_TrackerRandom_{}_{}.geo.setup".format( name, towers[0][0], towers[0][1], nLayersToTurnOff, seedString )

    
    layersToConsider = []
    for tower in towers:
        for iLayer in range( 1, nTotalLayers + 1):
            layersToConsider.append( (tower, iLayer) )
    

    random.seed(int(seedString, base=36))
    layersToTurnOff = random.sample( layersToConsider, nLayersToTurnOff)

        
    
    with open(outFile, "w") as f:
        f.write( "Include {}\n\n".format(inFile) )

    for tower, iLayer in layersToTurnOff:
        TurnOffOneTrackerLayerInOneTower( outFile, iLayer, tower)


for i in [1, 2, 5, 10, 20]:
    for l in string.ascii_uppercase[0:10]:
        DegradeTrackerRandomly(i, l)

#DegradeTracker( "all" )
