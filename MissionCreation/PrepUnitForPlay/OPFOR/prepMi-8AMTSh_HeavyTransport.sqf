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

	this addWeaponTurret ["rhs_weap_CMFlareLauncher",[-1]];
	this addMagazineTurret ["60Rnd_CMFlareMagazine", [-1]];

	for "_i" from 1 to 3 do {
		this removeMagazinesTurret ["rhs_mag_762x54mm_100", [_i]];
		for "_y" from 1 to 6 do {
			this addMagazineTurret ["rhs_mag_762x54mm_250", [_i]];
		};
	};
	
	this animateSource ["HIDE_weapon_holders", 1, true];

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;
};

/* DO NOT INCLUDE

Script effects misc.
	Pylons empty
	"Weapon Holders" visually removed
	Vehicle cargo is empty

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


MI-8AMTSh
RHS_Mi8AMTSh_vvsc (Camo)
RHS_Mi8AMTSh_vvs (Gray)
Notes:
	Vehicle capacity: 18 --> 1 driver,
		1 copilot,
		3 gunners,
		13 cargo positions

	5x Crew:
		Pilot
			(+) Countermeasures Flares Burst [1 x 6]
			(-) Countermeasures (Chaff?) [10 x 7 (64)]
		Copilot
		Door Gunner (Left Door)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]
		Crew Chief (Right Door)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]
		Rear Gunner (Center Rear)
			(+) PKT 7.62x54mm Ball Tracer [250 x 6]
			(-) PKT 7.62x54mm Ball Tracer [100 x 12]

*/