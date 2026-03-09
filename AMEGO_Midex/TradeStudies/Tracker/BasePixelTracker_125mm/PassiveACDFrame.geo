// Setup file for the ComPair prototype

// Include section
// NEEDS THIS LINE TO VIEW ALONE:
//Include ../materials/Materials.geo

// this assumes that the structure is an inner support shell for the ACD

Volume topCarbon
topCarbon.Material CarbonFiber
topCarbon.Visibility 0
topCarbon.Color 1
topCarbon.Shape BRIK 48.5 48.5 0.05

Volume topRohacell
topRohacell.Material Rohacell
topRohacell.Visibility 0
topRohacell.Color 1
topRohacell.Shape BRIK 48.5 48.5 0.64

//  Side panels

Volume sideRohacell
sideRohacell.Material Rohacell
sideRohacell.Visibility 0
sideRohacell.Color 1
sideRohacell.Shape BRIK 48.5 0.64 34.25

Volume sideCarbon
sideCarbon.Material CarbonFiber
sideCarbon.Visibility 0
sideCarbon.Color 1
sideCarbon.Shape BRIK 48.5 0.05 34.25


# top  WLS bars
Volume topWLSbar
topWLSbar.Material PMTPlastic
topWLSbar.Visibility 0
topWLSbar.Color 3
topWLSbar.Shape BRIK 15.5 0.1 0.75

topWLSbar.Copy topWLSbar1
topWLSbar1.Position -32. 0. 0.
topWLSbar1.Mother topWLSpanel
 
topWLSbar.Copy topWLSbar2
topWLSbar2.Position 0. 0. 0.
topWLSbar2.Mother topWLSpanel

topWLSbar.Copy topWLSbar3
topWLSbar3.Position 32. 0. 0.
topWLSbar3.Mother topWLSpanel

# top SiPM
Volume topSiPM
topSiPM.Material Silicon
topSiPM.Visibility 0
topSiPM.Color 1
topSiPM.Shape BRIK 0.1 0.1 0.75

topSiPM.Copy topSiPM1
topSiPM1.Position -47.6 0. 0.
topSiPM1.Mother topWLSpanel

topSiPM.Copy topSiPM2
topSiPM2.Position -16.4 0. 0.
topSiPM2.Mother topWLSpanel

topSiPM.Copy topSiPM3
topSiPM3.Position -15.6 0. 0.
topSiPM3.Mother topWLSpanel

topSiPM.Copy topSiPM4
topSiPM4.Position 15.6 0. 0.
topSiPM4.Mother topWLSpanel

topSiPM.Copy topSiPM5
topSiPM5.Position 16.4 0. 0.
topSiPM5.Mother topWLSpanel

topSiPM.Copy topSiPM6
topSiPM6.Position 47.6 0. 0.
topSiPM6.Mother topWLSpanel

# top PCB between SiPMs
Volume topPCB
topPCB.Material CircuitBoard
topPCB.Visibility 0
topPCB.Color 4
topPCB.Shape BRIK 0.1 0.1 0.75

topPCB.Copy topPCB1
topPCB1.Position -47.8 0. 0.
topPCB1.Mother topWLSpanel

topPCB.Copy topPCB2
topPCB2.Position -16.2 0. 0.
topPCB2.Mother topWLSpanel

topPCB.Copy topPCB3
topPCB3.Position -15.8 0. 0.
topPCB3.Mother topWLSpanel

topPCB.Copy topPCB4
topPCB4.Position 15.8 0. 0.
topPCB4.Mother topWLSpanel

topPCB.Copy topPCB5
topPCB5.Position 16.2 0. 0.
topPCB5.Mother topWLSpanel

topPCB.Copy topPCB6
topPCB6.Position 47.8 0. 0.
topPCB6.Mother topWLSpanel

// side WLSPanelLong
Volume sideWLSPanelLong
sideWLSPanelLong.Material Vacuum
sideWLSPanelLong.Visibility 1
sideWLSPanelLong.Color 2
sideWLSPanelLong.Shape BRIK 50. 0.75 0.1

sideWLSPanelLong.Copy WLSLong1
WLSLong1.Position 0. 0. 34.9
WLSLong1.Mother sideACDPanel

sideWLSPanelLong.Copy WLSLong2
WLSLong2.Position 0. 0. -34.9
WLSLong2.Mother sideACDPanel



// side WLS Long bars
Volume sideBarLong
sideBarLong.Material PMTPlastic
sideBarLong.Visibility 1
sideBarLong.Color 3
sideBarLong.Shape BRIK 16. 0.75 0.1

sideBarLong.Copy sideBarLong1
sideBarLong1.Position -33. 0. 0.
sideBarLong1.Mother sideWLSPanelLong

sideBarLong.Copy sideBarLong2
sideBarLong2.Position 0. 0. 0.
sideBarLong2.Mother sideWLSPanelLong

sideBarLong.Copy sideBarLong3
sideBarLong3.Position 33. 0. 0.
sideBarLong3.Mother sideWLSPanelLong

# side SiPM in Long panel
Volume sideSiPML
sideSiPML.Material Silicon
sideSiPML.Visibility 1
sideSiPML.Color 1
sideSiPML.Shape BRIK 0.1 0.75 0.1

sideSiPML.Copy sidePML1
sidePML1.Position -49.1 0. 0. 
sidePML1.Mother sideWLSPanelLong

sideSiPML.Copy sidePML2
sidePML2.Position -16.9 0. 0. 
sidePML2.Mother sideWLSPanelLong

sideSiPML.Copy sidePML3
sidePML3.Position -16.1 0. 0. 
sidePML3.Mother sideWLSPanelLong

sideSiPML.Copy sidePML4
sidePML4.Position 16.1 0. 0. 
sidePML4.Mother sideWLSPanelLong

sideSiPML.Copy sidePML5
sidePML5.Position 16.9 0. 0. 
sidePML5.Mother sideWLSPanelLong

sideSiPML.Copy sidePML6
sidePML6.Position 49.1 0. 0. 
sidePML6.Mother sideWLSPanelLong

// side WLS Panel short
Volume sideWLSPanelShort
sideWLSPanelShort.Material Vacuum
sideWLSPanelShort.Visibility 1
sideWLSPanelShort.Color 2
sideWLSPanelShort.Shape BRIK 0.1 0.75 34.8

sideWLSPanelShort.Copy WLSShort1
WLSShort1.Position -49.9 0. 0.
WLSShort1.Mother sideACDPanel

sideWLSPanelShort.Copy WLSShort2
WLSShort2.Position  49.9  0. 0.
WLSShort2.Mother sideACDPanel



// side WLS Short bars
Volume sideBarShort
sideBarShort.Material PMTPlastic
sideBarShort.Visibility 1
sideBarShort.Color 3
sideBarShort.Shape BRIK 0.1 0.75 16.8

sideBarShort.Copy sideBarShort1
sideBarShort1.Position 0. 0. -17.2
sideBarShort1.Mother sideWLSPanelShort

sideBarShort.Copy sideBarShort2
sideBarShort2.Position 0. 0. 17.2
sideBarShort2.Mother sideWLSPanelShort

# side SiPM in Short panel
Volume sideSiPMS
sideSiPMS.Material Silicon
sideSiPMS.Visibility 1
sideSiPMS.Color 1
sideSiPMS.Shape BRIK 0.1 0.75 0.1

sideSiPMS.Copy sidePMS1
sidePMS1.Position 0. 0. -34.1
sidePMS1.Mother sideWLSPanelShort

sideSiPMS.Copy sidePMS2
sidePMS2.Position 0. 0. -0.3
sidePMS2.Mother sideWLSPanelShort

sideSiPMS.Copy sidePMS3
sidePMS3.Position 0. 0. 0.3
sidePMS3.Mother sideWLSPanelShort

sideSiPMS.Copy sidePMS4
sidePMS4.Position 0. 0. 34.1
sidePMS4.Mother sideWLSPanelShort

















