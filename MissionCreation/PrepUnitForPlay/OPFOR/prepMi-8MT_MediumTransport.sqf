if (isServer) then { 
	{
		this removeWeaponTurret [_x, [-1]];  
	} forEach (this weaponsTurret [-1]);
	{
		this removeMagazinesTurret [_x, [-1]];  
	} forEach (this magazinesTurret [-1]);
	this addWeaponTurret ["rhs_weap_CMFlareLauncher",[-1]];
	this addMagazineTurret ["60Rnd_CMFlareMagazine", [-1]];


	for "_i" from 1 to 2 do {
		this removeMagazinesTurret ["rhs_mag_762x54mm_100", [_i]];
		for "_y" from 1 to 6 do {
			this addMagazineTurret ["rhs_mag_762x54mm_250", [_i]];
		};
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


MI-8MT
RHS_Mi8MT_vvsc (Camo)
RHS_Mi8MT_vvs (Gray)
RHS_Mi8MT_vdv (Olive)
RHS_Mi8MT_vv (Jungle)
Notes:
	Vehicle capacity: 18 --> 1 driver,
		1 copilot,
		2 gunners,
		14 cargo positions

	4x Crew:
		Pilot
			(+) Countermeasures Flares Burst [1 x 6]
			(-) Countermeasures (Chaff?) [10 x 10 (96)]
		Copilot
		Crew Chief (Left Door)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]
		Rear Gunner (Rear Right)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]

*/