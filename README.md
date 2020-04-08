# Geometry
Location of the geometry files for ComPair and AMEGO

use: >>geomega -g AmegoBase.geo.setup


The current geometry model for the Probe conncept is found under AMEGO_Probe and the current geometry to the MidEx concept is under AMEGO_Midex. These geometries share common files in Detectors and materials.

#File Structure

While working on simulations please maintain the same structure indicated below so as to allow for easy comparison between models:

Each detector subsystem has 3 separate files: *Layer.geo, *Detector.geo, *Properties.det where * is the name of the subsystem. 

-The .det file contains the physical properties of the detector such as whether the detector is made of strips or voxels etc, strip pitch, trigger threshold so on 
-The *Layer.geo file constructs both the individual wafers/logs and then places those structures into segments. It then places those segments into a single detector layer.
-The *Detector.geo file then takes the individual layers and stacks them (in the z axis) to form a complete detector subsystem.

The "AmegoBase.geo.setup" file combines all the single detector subsystems into a whole instrument. It only has to include reference to the individual *Detector.geo files as it effectively treats the subsystems as monolithic units that can be placed at different locations.


#Checking out 
The repository locally. The current setup is that each branch is 
it’s own repository, so you’ll have
to check them out all separately. 

git clone https://github.com/ComPair/Geometry.git

git checkout master

#Add to Repository
Note: there is some dancing you have to do 
to add your git name/email to the git config 
file (which is located at ~/.gitconfig)

git add “myfile”

git commit -m “first commit of myfile” 

git push origin master

#Change a file

git commit -m “2nd commit of myfile” myfile

git push origin master

#Updating to current version

git pull

#Basic start up tutorial
http://rogerdudler.github.io/git-guide/


