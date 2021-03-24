# PrepUnitForPlay

Ensuring that inserted assets are compliant with the FNF standards of play is important. These scripts are intended to be placed in an asset's "init" script field and will make them compliant.


Each file will contain the init script to apply to a vehicle of that classname, followed by a text description in the following format:

~~~
Script effects misc.
	[Visual/mechanical changes made by the init aside from armaments]

Legend:
	(+) means something was added or changed
	(-) means something was removed
	(=) means something is a default configuration


Variant 1
Variant 1 classname 1
Variant 1 classname 2 (if different camos, for example)
Notes: 
	[Notes about this unit/variant]
	[#]x passenger seats
	[#]x Crew:
		Driver
		Gunner
			[Armaments]
		Commander
			[Armaments]


Variant 2
Variant 2 classname 1
Variant 2 classname 2 (if different camos, for example)
Notes: 
	[Notes about this unit/variant]
	[Vehicle capacity from config]

	[#]x Crew:
		Driver
		Gunner
			[Armaments]
		Commander
			[Armaments]
~~~