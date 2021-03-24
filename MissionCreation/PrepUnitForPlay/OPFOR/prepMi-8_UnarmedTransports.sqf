if (isServer) then { 

	{
		this removeWeaponTurret [_x, [-1]];  
	} forEach (this weaponsTurret [-1]);
	{
		this removeMagazinesTurret [_x, [-1]];  
	} forEach (this magazinesTurret [-1]);
	this addWeaponTurret ["rhs_weap_CMFlareLauncher",[-1]];
	this addMagazineTurret ["60Rnd_CMFlareMagazine", [-1]];

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


Mi-8T
RHS_Mi8T_vvsc (Camo)
RHS_Mi8T_vvs (Gray)
RHS_Mi8T_vdv (Olive)
RHS_Mi8T_vv (Jungle)
Notes:
	Vehicle capacity: 18 --> 1 driver,
		1 copilot,
		3 firing positions,
		13 cargo positions

	2x Crew:
		Pilot
		Copilot


Mi-8AMT
RHS_Mi8AMT_vvsc (Camo)
RHS_Mi8AMT_vvs (Gray)
RHS_Mi8AMT_vdv (Olive)
Notes:
	Adds countermeasures for pilot.

	Vehicle capacity: 18 --> 1 driver,
		1 copilot,
		3 firing positions,
		13 cargo positions

	Can float: No

	2x Crew:
		Pilot
			(+) Countermeasures Flares Burst [1 x 6]
			(-) Countermeasures (Chaff?) [10 x 10 (96)]
		Copilot

*/