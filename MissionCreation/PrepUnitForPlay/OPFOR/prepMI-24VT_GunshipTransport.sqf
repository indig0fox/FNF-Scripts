if (isServer) then { 

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


Mi-24VT
RHS_Mi24Vt_vvs (Gray)
RHS_Mi24Vt_vvsc (Camo)
Notes:
	Vehicle capacity: 10 --> 1 driver,
		1 gunner,
		4 firing positions,
		4 cargo positions

	2x Crew:
		Pilot
			(=) Countermeasures DIRCM [80 x 9]
		Copilot
			(=) YakBYu chin turret 12.7x108mm Ball Tracer [1470 x 1]

*/