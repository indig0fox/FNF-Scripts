if (isServer) then {
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


BRDM-2
rhsgref_BRDM2_vdv (Olive)
Other classnames exist but only changes a decal, not camo.
Notes:
	Standard 3-crew turreted variant.

	Vehicle capacity: 11 --> 1 driver,
		1 commander,
		1 gunner,
		6 firing positions,
		2 cargo positions

	Can float: Yes

	3x Crew:
		Driver
		Gunner
			(=) PKT 7.62x54mm [250 x 8]
			(=) KPVT 14.5x115mm [50 x 10]
		Commander


BRDM-2UM
rhsgref_BRDM2UM_vdv
Other classnames exist but only changes a decal, not camo.
Notes:
	Unarmed command variant.

	Vehicle capacity: 10 --> 1 driver,
		1 commander,
		6 firing positions,
		2 cargo positions

	Can float: Yes

	2x Crew:
		Driver
		Commander


BRDM-2UM (Armed)
rhsgref_BRDM2_HQ_vdv
Other classnames exist but only changes a decal, not camo.
Notes:
	Armed command variant.

	Vehicle capacity: 10 --> 1 driver,
		1 gunner,
		6 firing positions,
		2 cargo positions

	Can float: Yes

	2x Crew:
		Driver
		Gunner
			(=) PKT 7.62x54mm [250 x 8]

*/