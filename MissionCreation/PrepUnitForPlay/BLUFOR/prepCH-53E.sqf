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


CH-53E
rhsusf_CH53E_USMC (Gray)
rhsusf_CH53E_USMC_D (Gray)
Notes:
	Vehicle capacity: 26 --> 1 driver,
		1 gunner,
		24 cargo positions

	2x Crew:
		Pilot
			(=) DIRCM AN/AAQ-24 [120 x 10]
		Observer (Camera)
			(=) Laser Designator


CH-53E (Cargo)
rhsusf_CH53e_USMC_cargo (Gray)
rhsusf_CH53e_USMC_D_cargo (Gray)
Notes:
	Can internally carry a vehicle up to 9000kg.

	Vehicle capacity: 2 --> 1 driver,
		1 gunner

	2x Crew:
		Pilot
			(=) DIRCM AN/AAQ-24 [120 x 10]
		Observer (Camera)
			(=) Laser Designator

*/