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


UH-60M
RHS_UH60M (Olive)
RHS_UH60M_d (Olive)
Notes:
	Vehicle capacity: 16 --> 1 driver,
		1 copilot,
		2 gunners,
		4 firing positions,
		8 cargo positions

	4x Crew:
		Pilot
			(=) DIRCM AN/ALQ-144 [120 x 10]
		Copilot
		Crew Chief (Left)
			(=) M134 7.62x51mm [4000 x 1]
		Door Gunner (Right)
			(=) M134 7.62x51mm [4000 x 1]


UH-60M (Unarmed)
RHS_UH60M2 (Olive)
RHS_UH60M2_d (Olive)
Notes:
	Vehicle capacity: 16 --> 1 driver,
		1 copilot,
		4 firing positions,
		10 cargo positions

	2x Crew:
		Pilot
			(=) DIRCM AN/ALQ-144 [120 x 10]
		Copilot

*/