if (isServer) then { 
	for "_i" from 1 to 6 do {
		this setPylonLoadout [_i, ""]; 
	};

	{
		this removeWeaponTurret [_x, [-1]];  
	} forEach (this weaponsTurret [-1]);
	{
		this removeMagazinesTurret [_x, [-1]];  
	} forEach (this magazinesTurret [-1]);

	this addWeaponTurret ["rhsusf_weap_CMFlareLauncher",[-1]];
	this addMagazineTurret ["60Rnd_CMFlareMagazine", [-1]];


	{
		this removeWeaponTurret [_x, [0]];  
	} forEach (this weaponsTurret [0]);
	{
		this removeMagazinesTurret [_x, [0]];  
	} forEach (this magazinesTurret [0]);

	this addWeaponTurret ["RHS_weap_m134_pylon", [0]]; 
	this addMagazineTurret ["rhs_mag_m134_pylon_3000", [0]];

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;
};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty
	Pylons empty

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


AH-1Z
RHS_AH1Z (Gray)
RHS_AH1Z_wd (Gray)
Notes:
	Vehicle capacity: 2 --> 1 driver,
		1 gunner

	4x Crew:
		Pilot
			(=) Countermeasures Flares Burst [1 x 6]
			(-) Countermeasures Mixed Burst  [1 x 6]
			(-) Hydra (M151 HE) [14]
			(-) AIM-9M [2]
		Gunner
			(+) M134D-H Minigun 7.62x51mm [3000 x 1]
			(-) M197 SAP HEI [750 x 1]
			(-) AGM-114 Hellfire [8]

*/