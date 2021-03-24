if (isServer) then { 
	for "_i" from 1 to 2 do {
		this setPylonLoadout [ _i, ""]; 
	};

	{
		this removeWeaponTurret [_x, [-1]];  
	} forEach (this weaponsTurret [-1]);
	{
		this removeMagazinesTurret [_x, [-1]];  
	} forEach (this magazinesTurret [-1]);

	this addWeaponTurret ["rhsusf_weap_CMFlareLauncher",[-1]];
	this addMagazineTurret ["60Rnd_CMFlareMagazine", [-1]];


	for "_i" from 1 to 2 do {
		{
			this removeWeaponTurret [_x, [_i]];  
		} forEach (this weaponsTurret [_i]);
		{
			this removeMagazinesTurret [_x, [_i]];  
		} forEach (this magazinesTurret [_i]);
		this addWeaponTurret [format["rhs_weap_m240H_%1",_i], [_i]];
		this addMagazineTurret ["rhs_mag_1100Rnd_762x51_M240", [_i]];
	};

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;
};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


UH-1Y (MG)
RHS_UH1Y (Gray)
RHS_UH1Y_d (Gray)
Notes:
	Vehicle capacity: 11 --> 1 driver,
		3 gunners,
		6 firing positions,
		1 cargo position

	4x Crew:
		Pilot
			(=) Countermeasures Flares Burst [1 x 6]
			(-) Hydra (M151 HE) [14]
		Observer (Camera)
			(=) Laser Designator
		Left door gunner
			(+) M240H 7.62x51mm [1100 x 1]
			(-) M134 7.62x51mm [4000 x 1]
		Right door gunner
			(+) M240H 7.62x51mm [1100 x 1]
			(-) M134 7.62x51mm [4000 x 1]


UH-1Y (Unarmed)
RHS_UH1Y_UNARMED (Gray)
RHS_UH1Y_UNARMED_d (Gray)
Notes:
	Vehicle capacity: 11 --> 1 driver,
		1 gunner,
		8 firing positions,
		1 cargo position

	2x Crew:
		Pilot
			(=) Countermeasures Flares Burst [1 x 6]
		Observer (Camera)
			(=) Laser Designator

*/