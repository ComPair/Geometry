# Geometry
Location of the geometry files

We can put geometry files here to use in the MEGAlib simulation

The current geometry model to use is the TowerModel
The BaseModel was from the IDL, we've since modified the design. 

#File Structure

While working on simulations please maintain the same structure indicated below so as to allow for easy comparison between models:

Each detector subsystem has 3 separate files: *Layer.geo, *Detector.geo, *Properties.det where * is the name of the subsystem. 

-The .det file contains the physical properties of the detector such as whether the detector is made of strips or voxels etc, strip pitch, trigger threshold so on 
-The *Layer.geo file constructs both the individual wafers/logs and then places those structures into segments. It then places those segments into a single detector layer.
-The *Detector.geo file then takes the individual layers and stacks them (in the z axis) to form a complete detector subsystem.

 Example: The SiStripLayer.geo files constructs a single Si Wafer, then places 25 of those wafers into a single 5x5 wafer segment. Then it takes 4 of those segments and constructs a 2x2 segment layer.

The "CompairBase.geo.setup" file combines all the single detector subsystems into a whole instrument. It only has to include reference to the individual *Detector.geo files as it effectively treats the subsystems as monolithic units that can be placed at different locations.

***There is also a keynote file that shows the geometry currently reflected by the CompairBase.geo.setup. The keynote included is out-of-date, since we've migrated to the tower model from the base model***


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


