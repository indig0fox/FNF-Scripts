if (isServer) then {
	this removeMagazinesTurret ["rhs_12Rnd_m821_HE", [0]];
	for "_i" from 1 to 20 do {
		this addMagazineTurret ["rhs_1Rnd_m821_HE", [0]];
	};

	this addMagazineTurret ["8Rnd_82mm_Mo_Flare_white", [0]];

	for "_i" from 1 to 4 do {
		this addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white", [0], 5];
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


M252 Mortar
RHS_M252_WD (Gray)
RHS_M252_D (Gray)
Notes:
	2x Crew:
		Gunner
			(+) 81mm M821 HE Mortar Shell [1 x 20]
			(-) 81mm M821 HE Mortar Shell [12 x 1]
			(+) Flare (White) [8 x 1]
			(+) Smoke Shell (White) [5 x 4]
		Assistant

*/



