if (isServer) then { 
	this removeWeaponTurret ["RHS_MK19", [0]]; 
	this removeMagazinesTurret ["RHS_96Rnd_40mm_MK19_M430A1", [0]];
	this removeMagazinesTurret ["RHS_96Rnd_40mm_MK19_M1001", [0]];

	this addWeaponTurret ["rhs_weap_m240_m113", [0]]; 
	for "_i" from 1 to 7 do {
		this addMagazineTurret ["rhs_mag_762x51_M240_200", [0]];
	};

	this removeMagazinesTurret ["rhs_mag_200rnd_127x99_mag_Tracer_Red", [0]];
	for "_i" from 1 to 5 do {
		this addMagazineTurret ["rhs_mag_100rnd_127x99_mag_Tracer_Red", [0]];
	};

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;

	this animateSource ["DUKE_Hide", 1, true];
};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty
	Large DUKE antennas on rear are hidden

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


M1117 ASV
rhsusf_M1117_W (Woodland)
rhsusf_M1117_D (Desert)
rhsusf_M1117_O (Olive Drab)
Notes:
	Vehicle capacity: 9 --> 1 driver,
		1 commander,
		1 gunner,
		2 firing positions,
		4 cargo positions

	Can float: No

	2x Crew:
		Driver
		Gunner
			(+) M240 [200 x 7]
			(+) M2 [100 x 5]
			(-) M2 [200 x 5]
			(-) Mk19 [100 x 6]
		Commander
			(=) M257_8 SmokeScreen [1 x 2]

*/