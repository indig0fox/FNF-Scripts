if (isServer) then { 
	this animateSource ["Hide_Turret_Armor_Front",0];
	this animateSource ["Hide_Turret_Armor_Side",0];
	this animateSource ["IFF_Panels_Hide",1];

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;

};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty
	IFF (yellow) panels hidden on front and sides


Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


M113A3 (M2)
rhsusf_m113_usarmy (Woodland)
rhsusf_m113d_usarmy (Desert)
Notes:
	Smokescreen deploys front 15m, dissipates in 10 seconds.

	Vehicle capacity: 14 --> 1 driver,
		2 gunners,
		2 firing positions,
		9 cargo positions

	Can float: Yes

	2x Crew:
		Driver
			(=) Smokegen
		Commander Gunner
			(=) M259 Smokescreen [1 x 3]
			(=) M2 [100 x 15]


M113A3 (M240)
rhsusf_m113_usarmy_M240 (Woodland)
rhsusf_m113d_usarmy_M240 (Desert)
Notes:
	Vehicle capacity: 14 --> 1 driver,
		2 gunners,
		2 firing positions,
		9 cargo positions

	Can float: Yes

	2x Crew:
		Driver
			(=) Smokegen
		Commander Gunner
			(=) M259 Smokescreen [1 x 3]
			(=) M2 [100 x 11]


M113A3 (Unarmed)
rhsusf_m113_usarmy_unarmed (Woodland)
rhsusf_m113d_usarmy_unarmed (Desert)
Notes:
	Vehicle capacity: 13 --> 1 driver,
	1 gunner,
	2 firing positions,
	9 cargo positions

	Can float: Yes

	2x Crew:
		Driver
			(=) Smokegen
		Commander Gunner
			(=) M259 Smokescreen [1 x 3]

*/