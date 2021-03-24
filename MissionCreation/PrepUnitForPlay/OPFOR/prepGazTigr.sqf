if (isServer) then {
	this removeWeaponTurret ["RHS_weap_Ags30_tigr",[1]];
	this removeMagazinesTurret ["RHS_mag_VOG30_30", [1]];

	this animateSource ["spare_hide", 1, true];

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;
};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty
	Spare wheel hidden

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


GAZ-233014
rhs_tigr_sts_vdv (Olive)
rhs_tigr_sts_3camo_vdv (Camo)
Notes: 
	Armed variant. Grenade launcher removed.

	Vehicle capacity: 8 --> 1 driver,
		2 gunners,
		5 cargo positions
		Roles: None

	Can float: No

	2x Crew:
		Driver
		Gunner
			(=) PKM 7.62x54mm [100 x 19]
		Alt Gunner
			(-) AGS-30 30mm HE [30 x 12]


GAZ-2333114
rhs_tigr_m_vdv (Olive)
rhs_tigr_m_3camo_vdv (Camo)
Notes:
	Unarmed, with single center roof hatch for FFV. Smoke launcher deploys ~25m forward, narrow, and dissipates after 10-15 seconds.

	Vehicle capacity: 9 --> 1 driver,
		1 firing position,
		7 cargo positions

	Can float: No

	2x Crew:
		Driver
			(=) Smoke 902B [1 x 4]
		Gunner (FFV)


GAZ-233011
rhs_tigr_vdv (Olive)
rhs_tigr_3camo_vdv (Camo)
Notes:
	Unarmed, with two passenger roof hatches (FWD/REAR) for FFV.

	Vehicle capacity: 9 --> 1 driver,
		2 gunners,
		6 cargo positions
	
	Can float: No

	3x Crew:
		Driver
		Passenger (Front Hatch) (FFV)
		Passenger (Rear Hatch) (FFV)


*/