if (isServer) then {
	[] spawn {
		uiSleep 5;
		this removeWeaponTurret ["ace_hot_generic_launcher", [0]];
	};

	clearWeaponCargo this;
	clearItemCargo this;
	clearMagazineCargo this;
	clearBackpackCargo this;
};

/* DO NOT INCLUDE

Script effects misc.
	Vehicle cargo is empty
	Pylons empty

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


Wiesel 2 (ATGM)
I_LT_01_AT_F
Notes:

	Vehicle capacity: 2 --> 1 driver,
		1 commander

	Can float: No

	2x Crew:
		Driver
		Commander
			(=) M2 12.7mm [100 x 4]
			(=) (FWD) Smoke Screen [1 x 2]
			(-) HOT-2 missile [2 x 4]

*/