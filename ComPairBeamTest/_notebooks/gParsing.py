import os
import re
import numpy as np

def RevFileParser_general(file):
	'''Parses the main infos of the simulations
	'''
	f = open(file)
	data_frame_general = {}
	keys = ['Type', 
			'Version', 
			'Geometry' ,
			'Date', 
			'MEGAlib']
	for line in f:
	    for k in keys:
	        if k in line:
	            if len(line.split()[1:]) == 1:
	            	if k is 'Geometry':
	            	    data_frame_general[k] = [os.path.basename(line.split()[1])]\
	            	                                         +['','','','','','','']
	            	else:
	                    data_frame_general[k] = line.split()[1:]+['','','','','','','']
	            elif len(line.split()[1:]) == 2:
	                data_frame_general[k] = line.split()[1:]+['','','','','','']
	            elif len(line.split()[1:]) == 3:
	                data_frame_general[k] = line.split()[1:]+['','','','','']
	            elif len(line.split()[1:]) == 4:
	                data_frame_general[k] = line.split()[1:]+['','','','']
	            else:
	            	data_frame_general[k] = line.split()[1:]
	f.close()
	return data_frame_general

def RevFileParser_events(file):
	'''Parses the events parameters
	'''

	### --- Printing the reconstruction information --- ###
	f, f1 = open(file), open(file)
	lines = f.readlines()
	counter = 0
	for line in lines:
		if 'Trigger statistics:' in line:
			for i in range (len(lines)-(counter+5)):
				print(lines[i+counter])
		counter += 1
	f.close()

	#### --- Storing the unique parameters (that appear only once per each event) --- ####
	keys = ['PE ']
	data_frame_events = {}
	PE_ , SP_, RE_ = [], [], []
	lines = f1.readlines()
	for l, line in enumerate(lines):
		if 'SE' in line and lines[l+1].split()[-1]=='CO':
			#en_tot = np.sum(np.array(float(lines[l+8].split()[1,3])))
			CE_params = lines[l+8].split()
			if len(CE_params) == 5:
				#print(float(CE_params[1]), float(CE_params[3]))
				en_tot = float(CE_params[1])+float(CE_params[3])
				en_scat_ph =  float(CE_params[1])
				en_recoil =  float(CE_params[3])
				PE_.append(en_tot)
				SP_.append(en_scat_ph)
				RE_.append(en_recoil)
	data_frame_events['PE'] = np.array(PE_)
	data_frame_events['RE'] = np.array(RE_)
	data_frame_events['SP'] = np.array(SP_)
	f1.close()
	return data_frame_events


def SimFileParser_general(file):
	'''Parses the main infos of the simulations
	'''
	f = open(file)
	data_frame_general = {}
	keys = ['Version', 
			'Date', 
			'MEGAlib' ,
			'Seed', 
			'SimulationStartAreaFarField',
			'BeamType',
			'SpectralType',
			'TB',
			'TE',
			'TS',
			'Geometry']
	for line in f:
	    for k in keys:
	        if k in line:
	            if len(line.split()[1:]) == 1:
	            	if k is 'Geometry':
	            	    data_frame_general[k] = [os.path.basename(line.split()[1])]\
	            	                                         +['','','','','','','']
	            	else:
	                    data_frame_general[k] = line.split()[1:]+['','','','','','','']
	            elif len(line.split()[1:]) == 2:
	                data_frame_general[k] = line.split()[1:]+['','','','','','']
	            elif len(line.split()[1:]) == 3:
	                data_frame_general[k] = line.split()[1:]+['','','','','']
	            elif len(line.split()[1:]) == 4:
	                data_frame_general[k] = line.split()[1:]+['','','','']
	            else:
	            	data_frame_general[k] = line.split()[1:]
	f.close()
	return data_frame_general
	
def SimFileParser_events(file):
	'''Parses the events parameters
	'''
	f, f1, f2, f3 = open(file), open(file), open(file), open(file)
	regex = 'SE'
	lines = f.read()
	match = re.findall(regex, lines)
	print('// ------------------------------- //')
	print('// Number of triggers found: ' + str(len(match))+ '  //')
	print('// ------------------------------- //')
	f.close()
	#### --- Storing the unique parameters (that appear only once per each event) --- ####
	data_frame_events = {}
	ID, TI, ED, EC, NS = [], [], [], [], []
	unique_params = ['ID', 'TI', 'ED', 'EC', 'NS']
	for line in f1:
	    if 'ID' in line:
	    	entry = line.split()
	    	ID.append((float(entry[1]), float(entry[2])))
	    elif 'TI' in line:
	    	TI.append(float(line.split()[1]))
	    elif 'ED' in line:
	    	ED.append(float(line.split()[1]))
	    elif 'EC' in line:
	    	EC.append(float(line.split()[1]))
	    elif 'NS' in line:
	    	NS.append(float(line.split()[1]))
	keys = range(0,len(match))
	for k in keys:
	    data_frame_events[k] = {'ID':ID[k],'TI':TI[k],'ED':ED[k],'EC':EC[k],'NS':NS[k]}
	f1.close()
	#### ----------------------- Dealing with "IA" parameters ----------------------- ####
	ia_params = ['INIT','PAIR','COMP','PHOT','BREM','RAYL','IONI',
				 'INEL','CAPT','DECA','ESCP','ENTR','EXIT', 'BLAK']
	ia_evt_list = []
	ia_inter_dict = {}
	inter_prev = 0
	evt = 0		 
	for line in f3:
		if 'IA' in line:
			cells = line.split(';')
			inter = cells[0].split()
			inter_t, inter_n = inter[1], int(inter[2])
			if inter_n > inter_prev:
				inter_prev = inter_prev + 1
				ia_inter_dict[inter_t] = cells[3:]
			else:
				#print('New event!! ', evt)
				ia_evt_list.append(ia_inter_dict)
				ia_inter_dict = {}
				ia_inter_dict[inter_t] = cells[3:]
				inter_prev = 0
				evt = evt +1
	for k in keys[:-1]:
	    data_frame_events[k].update({'IA': ia_evt_list[k]}) 
	f3.close()
	#### ----------------------- Dealing with "HT" parameters ----------------------- ####
	data_frame_HT = {'DetID':[],
					 'EnDep':[],
					 'HitX':[],
					 'HitY':[],
					 'HitZ':[]}
	for line in f2:
		if 'HTsim' in line:
			cells = line.split(';')
			data_frame_HT['DetID'].append(int(cells[0].split()[1]))
			data_frame_HT['EnDep'].append(float(cells[4]))
			data_frame_HT['HitX'].append(float(cells[1]))
			data_frame_HT['HitY'].append(float(cells[2]))
			data_frame_HT['HitZ'].append(float(cells[3]))
			
	f2.close()
	return data_frame_events, data_frame_HT

def DetectorIDdict():
	det_id_dict = {'1' : '2D strip detector',
				   '2' : 'MEGA style calorimeter',
				   '3' : '3D strip detector',
				   '4' : 'Universal detectoer',
				   '5' : '~ Drift chamber ~',
				   '6' : '~ 3D strip 2.0 ~',
				   '7' : 'Anger chamber',
				   '8' : '3D Voxel detector'}
	return det_id_dict
	
def ParticleIDdict():
	part_id_dict = {'1' : 'photon',
					'2' : 'electron',
					'3' : 'positron',
					'4' : 'proton',
					'5' : 'anti-proton',
					'6' : 'neutron',
					'7' : 'anti-neutron'}
	return part_id_dict



if __name__ == '__main__':

	'''Test module
	'''
	simf = '../CosimaSim/FarFieldPointSource_0.500MeV_Cos1.0_SingleBar.inc1.id1.sim'
	
	sim_info = SimFileParser_general(simf)
	sim_events, ht_data = SimFileParser_events(simf)