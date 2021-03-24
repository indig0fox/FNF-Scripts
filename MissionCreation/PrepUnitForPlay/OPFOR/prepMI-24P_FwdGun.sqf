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

	this addWeaponTurret ["rhs_weap_DIRCM_Lipa",[-1]];
	for "_i" from 1 to 9 do {
			this addMagazineTurret ["rhs_mag_DIRCM_Lipa", [-1]];
	};

	this addWeaponTurret ["RHS_weap_gau19", [-1]]; 
	this addMagazineTurret ["rhsusf_mag_gau19_melb_right", [-1]];

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


Mi-24P
RHS_Mi24P_vvsc (Camo)
RHS_Mi24P_vvs (Gray)
Notes:
	Gunship with forward mounted static weapon, pilot controlled. Copilot does not have armament.
	Gun is AH-6 Littlebird 50cal minigun, 1300 rounds

	Vehicle capacity: 10 --> 1 driver,
		1 gunner,
		4 firing positions,
		4 cargo positions

	2x Crew:
		Pilot
			(+) Countermeasures Flares Burst [1 x 6]
			(+) GAU-19/A 12.7x99mm Red Tracer [1300 x 1]
			(-) GSh-30-2 30mm [100 x 11]
			(-) S8 KoM rockets
		Copilot

*/