if (isServer) then { 
	this animateSource ["wheel_1_unhide", 1, true];
	this animateSource ["wheel_2_unhide", 1, true];
	this animateSource ["water_1_unhide", 1, true];
	this animateSource ["water_2_unhide", 1, true];

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;
};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty
	Spare wheels (rear obstruction) hidden
	Water crates (rear obstruction) hidden

Legend:
	(+) means something was added or changed and this is the final result
	(-) means something was removed from default
	(=) means something is a default configuration


BTR-60PB
rhs_btr60_vdv
Notes: 
	This BTR has less length than the others, slightly taller, front right spotlight obstructs gun.

	Vehicle capacity: 20 --> 1 driver,
		2 commanders,
		1 gunner,
		8 firing positions,
		8 cargo positions

	Can float: Yes

	3 x Crew:
		Driver
		Gunner
			(=) PKT 7.62x54mm [250 x 6]
			(=) KPVT 14.5x115mm [50 x 10]
		Commander
			+/- 36 deg azimuth periscope


BTR-70
rhs_btr70_vdv
Notes:
	Front right spotlight obstructs gun. Carries more PKT 7.62mm than others.

	Vehicle capacity: 20 --> 1 driver,
		2 commanders,
		1 gunner,
		8 firing positions,
		8 cargo positions

	Can float: Yes

	3 x Crew:
		Driver
		Gunner
			(=) PKT 7.62x54mm [250 x 8]
			(=) KPVT 14.5x115mm [50 x 10]
		Commander
			+/- 36 deg azimuth periscope


BTR-80
rhs_btr80_vdv
Notes:
	Use for OPFOR conventional forces only. CMDR smoke launcher deploys ~25m forward, narrow, and dissipates almost instantly.

	Vehicle capacity: 21 --> 
		1 driver,
		2 commanders,
		1 gunner,
		9 firing positions,
		8 cargo positions

	Can float: Yes

	3 x Crew:
		Driver
		Gunner
			(=) PKT 7.62x54mm [250 x 6]
			(=) KPVT 14.5x115mm [50 x 10]
			(=) FWD Smoke Launcher 902A [1 x 6]
		Commander
			+/- 36 deg azimuth periscope

*/