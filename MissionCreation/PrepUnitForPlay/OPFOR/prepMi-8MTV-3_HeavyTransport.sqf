if (isServer) then { 
	for "_i" from 1 to 4 do {
		this setPylonLoadout [_i, ""]; 
	};

	{
		this removeWeaponTurret [_x, [-1]];  
	} forEach (this weaponsTurret [-1]);
	{
		this removeMagazinesTurret [_x, [-1]];  
	} forEach (this magazinesTurret [-1]);

	this addWeaponTurret ["rhs_weap_CMFlareLauncher",[-1]];
	this addMagazineTurret ["60Rnd_CMFlareMagazine", [-1]];

	for "_i" from 1 to 3 do {
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
	Pylons empty
	Vehicle cargo is empty

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


Mi-8MTV-3
RHS_Mi8MTV3_vvsc (Camo)
RHS_Mi8MTV3_vvs (Gray)
Notes:
	Vehicle capacity: 18 --> 1 driver,
		1 copilot,
		3 gunners,
		13 cargo positions

	5x Crew:
		Pilot
			(=) Countermeasures (Chaff?) [10 x 10 (96)]
		Copilot
		Crew Chief (Cockpit, Front)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]
		Door Gunner (Left)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]
		Rear Right Port Gunner
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]

*/