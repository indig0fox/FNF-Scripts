if (isServer) then {

	this removeWeaponTurret ["GMG_40mm", [0]];
	this removeMagazinesTurret ["96Rnd_40mm_G_belt", [0]];

	this addWeaponTurret ["LMG_Minigun", [0]];
	for "_i" from 1 to 2 do {
		this addMagazineTurret ["2000Rnd_762x51_Belt_T_Red", [0]];
	};

	this addMagazineTurret ["2000Rnd_762x51_Belt_T_Red", [1]];

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


Speedboat Minigun
B_Boat_Armed_01_minigun_F
Notes:
	Vehicle capacity: 11 --> 1 driver,
		2 gunners,
		8 cargo positions
	
	Can float: Yes
	
	3x Crew:
		Driver
			(=) Smoke Screen [1 x 2]
		Commander (Targeting Display, Front Gun)
			(+) M134 Minigun 7.62mm [2000 x 2]
			(-) Mk 19 40mm HE [96 x 2]
		Rear Gunner
			(+) M134 Minigun 7.62mm [2000 x 2]
			(-) M134 Minigun 7.62mm [2000 x 1]

*/