// Setup file for the ComPair prototype

// Include section
// NEEDS THIS LINE TO VIEW ALONE:
//Include ../materials/Materials.geo

// this assumes that the structure is an inner support shell for the ACD

Volume topCarbon
topCarbon.Material CarbonFiber
topCarbon.Visibility 1
topCarbon.Color 1
topCarbon.Shape BRIK 48.5 48.5 0.05

Volume topRohacell
topRohacell.Material Rohacell
topRohacell.Visibility 1
topRohacell.Color 4
topRohacell.Shape BRIK 48.5 48.5 0.64

//  Side panels

Volume sideRohacell
sideRohacell.Material Rohacell
sideRohacell.Visibility 1
sideRohacell.Color 4
sideRohacell.Shape BRIK 48.5 0.64 34.25

Volume sideCarbon
sideCarbon.Material CarbonFiber
sideCarbon.Visibility 1
sideCarbon.Color 1
sideCarbon.Shape BRIK 48.5 0.05 34.25

