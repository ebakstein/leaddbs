function ea_storemachineprefs(name,val)

prefs=ea_prefs('');
machine=prefs.machine;
machine.(name)=val;
save([ea_gethome,'.ea_prefs.mat'],'machine');

