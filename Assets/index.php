<!DOCTYPE html>
<html>

<head>

	<link rel='stylesheet' href='//cdn.jsdelivr.net/npm/hack-font@3.3.0/build/web/hack-subset.css'>

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@600&family=Sumana:wght@700&display=swap" rel="stylesheet">

	<style>
		/* The sidenav */
		.sidenav {
			height: 100%;
			width: 220px;
			position: fixed;
			z-index: 1;
			top: 0;
			left: 0;
			background-color: #111;
			overflow-x: hidden;
			padding-top: 20px;

		}

		.sidenav h1 {
			padding: 6px 8px 6px 16px;
			font-weight: bolder;
			text-decoration: none;
			font-size: 30px;
			color: #f1f1f1;
			display: block;
			font-family: 'Open Sans', sans-serif;
		}

		.sidenav a {
			padding: 6px 8px 6px 16px;
			text-decoration: none;
			font-size: 25px;
			color: #818181;
			display: block;
			font-family: 'Open Sans', sans-serif;
		}

		.sidenav a:hover {
			color: #f1f1f1;
		}


		/* Style the buttons that are used to open and close the accordion panel */
		.accordion {
			background-color: #404040;
			color: #ffffff;
			cursor: pointer;
			margin: auto;
			padding: 10px 20px;
			width: 70%;
			/* text-align: Center; */
			border: 3px solid black;
			outline: none;
			transition: 0.4s;
		}

		.unitnote {
			color: #999999;
		}

		/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
		.active,
		.accordion:hover {
			background-color: #666666;
		}

		/* Style the accordion panel. Note: hidden by default */
		.panel {
			background-color: #404040;
			color: #ffffff;
			cursor: pointer;
			font-size: 12px;
			padding: 10px;
			display: none;
			overflow: hidden;
			margin: auto;
			text-align: left;
			max-width: 30%;
			font-weight: normal;
		}

		html {
			background-color: #111;
			color: white;
		}

		.centercontent {
			margin-left: 220px;

		}

		.main {
			margin: auto;
			text-align: center;
			width: 90%;
			padding: 0px 10px;
			font-family: 'Open Sans', sans-serif;
		}

		.main h1 {
			font-weight: bolder;
			font-size: 45px;
			font-family: 'Sumana', serif;
			margin: 0px;
			padding: 0px;
			display: block;
			text-align: center;
		}

		.main h2 {
			font-weight: bolder;
			font-size: 30px;
			font-family: 'Sumana', serif;
			margin: 0px;
			padding: 0px;
		}

		.main table {
			border-collapse: collapse;
			width: 100%;
			color: black;
		}

		.main th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #ff9933;
		}

		.main tr {
			border-left: 1px solid #000000;
			border-right: 1px solid #000000;
		}

		.main td,
		.main th {
			border-top: 1px solid #000000;
			border-bottom: 1px solid #000000;
			border-left: 1px solid #8c8c8c;
			border-right: 1px solid #8c8c8c;
			padding: 2px;
			font-size: 10px;
			height: 30px;
		}

		.footer {
			position: fixed;
			left: 0;
			right: 0;
			bottom: 0;
			width: 100%;
			background-color: #333333;
			color: white;
			text-align: center;
			z-index: 99;
			font-family: 'Arial Narrow', sans-serif;
		}

		.blutabledata {
			background-color: #99ccff;
		}

		.opftabledata {
			background-color: #ff9999;
		}

		.indtabledata {
			background-color: #ccffcc;
		}

		.blutabledata:hover,
		.opftabledata:hover,
		.indtabledata:hover {
			background-color: #ffffff;
		}

		.footer {
			position: fixed;
			left: 0;
			right: 0;
			bottom: 0;
			width: 100%;
			background-color: #333333;
			color: white;
			text-align: center;
			z-index: 99;
			font-family: 'Arial Narrow', sans-serif;
		}
	</style>
</head>

<body>

	<div class="sidenav">
		<h1>FNF ASSETS</h1>
		<a href="index.php">All</a>
		<a href="blufor.php">Blufor</a>
		<a href="opfor.php">Opfor</a>
		<a href="indfor.php">Indfor</a>
		<a href="contact.php">Contact</a>
	</div>

	<div class="centercontent">

		<div class="main">

			<h1>All Assets</h1>
			<p style='text-align:center'>To view more specific lists, select from the left.</p>

			<?php

			// DB Connect
			// sqlite
			$db = new SQLite3('fnfassets.db');

			/* Postgres
	$handle = pg_connect("host=localhost hostaddr=127.0.0.1 port=5432 dbname=fnfassets user=readonly password=heineken");

	if ($handle) {
		echo '<p>Connection attempt succeeded.</p>';
		echo '<p>Connected to DB ' . pg_dbname() . '.</p>';
	} else {
		echo '<p>Connection attempt failed.</p>';
	}
 */

			?>

			<?php

			$allAllQuery = "SELECT ASSETS.FACTION,
		ASSETS.DISPLAYNAME,
		ASSETS.DRIVERSEATS,
		ASSETS.GUNNERSEATS,
		ASSETS.COMMANDERSEATS,
		ASSETS.PILOTSEATS,
		ASSETS.FFVSEATS,
		ASSETS.PASSENGERSEATS,
		DWEP1WEP.DISPLAYNAME AS DRIVERWEP1,
		CWEP1WEP.DISPLAYNAME AS COMMANDERWEP1,
		PWEP1WEP.DISPLAYNAME AS PILOTWEP1,
		PWEP2WEP.DISPLAYNAME AS PILOTWEP2,
		PWEP3WEP.DISPLAYNAME AS PILOTWEP3,
		GWEP1WEP.DISPLAYNAME AS GUNNERWEP1,
		GWEP2WEP.DISPLAYNAME AS GUNNERWEP2,
		GWEP3WEP.DISPLAYNAME AS GUNNERWEP3
		FROM ASSETS
		LEFT JOIN
		WEAPONS DWEP1WEP ON ASSETS.DRIVERWEAPON1 = DWEP1WEP.CLASSNAME
		LEFT JOIN
		WEAPONS GWEP1WEP ON ASSETS.GUNNERWEAPON1 = GWEP1WEP.CLASSNAME
		LEFT JOIN
		WEAPONS GWEP2WEP ON ASSETS.GUNNERWEAPON2 = GWEP2WEP.CLASSNAME
		LEFT JOIN
		WEAPONS GWEP3WEP ON ASSETS.GUNNERWEAPON3 = GWEP3WEP.CLASSNAME
		LEFT JOIN
		WEAPONS CWEP1WEP ON ASSETS.COMMANDERWEAPON1 = CWEP1WEP.CLASSNAME
		LEFT JOIN
		WEAPONS CWEP2WEP ON ASSETS.COMMANDERWEAPON2 = CWEP2WEP.CLASSNAME
		LEFT JOIN
		WEAPONS CWEP3WEP ON ASSETS.COMMANDERWEAPON3 = CWEP3WEP.CLASSNAME
		LEFT JOIN
		WEAPONS PWEP1WEP ON ASSETS.PILOTWEAPON1 = PWEP1WEP.CLASSNAME
		LEFT JOIN
		WEAPONS PWEP2WEP ON ASSETS.PILOTWEAPON2 = PWEP2WEP.CLASSNAME
		LEFT JOIN
		WEAPONS PWEP3WEP ON ASSETS.PILOTWEAPON3 = PWEP3WEP.CLASSNAME
		ORDER BY CASE WHEN FACTION = 'BLUFOR' THEN 1 WHEN FACTION = 'OPFOR' THEN 2 WHEN FACTION = 'INDFOR' THEN 3 END,
			ASSETS.DISPLAYNAME;
		";



			// TABLE FORMAT

			echo '<table border="0" cellspacing="2" cellpadding="2">';
			$landHeadersBasic = '<tr>
				<th> Faction </th>
				<th> Display Name </th>
				<th> Drivers </th>
				<th> Gunners </th>
				<th> Cmdrs </th>
				<th> Pilots </th>
				<th> FFV </th>
				<th> Pax </th>
				<th> Driver Weapon </th>
				<th> Cmdr Weapon </th>
				<th> Pilot Wpn 1 </th>
				<th> Pilot Wpn 2 </th>
				<th> Pilot Wpn 3 </th>
				<th> Gunner Wpn 1 </th>
				<th> Gunner Wpn 2 </th>
				<th> Gunner Wpn 3 </th>
			</tr>';
			$landHeadersExt = '<tr>
				<th> Faction </th>
				<th> Display Name </th>
				<th> Drivers </th>
				<th> Gunners </th>
				<th> Cmdrs </th>
				<th> FFV </th>
				<th> Pax </th>
				<th> Driver Weapon </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
				<th> Gunner Wep 1 </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
				<th> Gunner Wep 2 </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
				<th> Gunner Wep 3 </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
				<th> Cmdr Wep 1 </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
				<th> Cmdr Wep 2 </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
				<th> Cmdr Wep 3 </th>
				<th> Caliber </th>
				<th> Ammo </th>
				<th> Mags </th>
			</tr>';

			echo $landHeadersBasic;
			$result = $db->query($allAllQuery);
			while ($line = $result->fetchArray(SQLITE3_NUM)) {
				if ($line[0] == 'BLUFOR') {
					echo "\t<tr class='blutabledata'>\n";
				} elseif ($line[0] == 'OPFOR') {
					echo "\t<tr class='opftabledata'>\n";
				} elseif ($line[0] == 'INDFOR') {
					echo "\t<tr class='indtabledata'>\n";
				} else {
					echo "\t<tr>\n";
				}
				foreach ($line as $col_value) {
					echo "\t\t<td>$col_value</td>\n";
				}
				echo "\t</tr>\n";
			};
			echo "</table>\n";


			/* 
		$queries = [$landBluQuery, $landOpfQuery, $landIndQuery];
		foreach ($queries as $query) {
			$result = $db->query($query[1]);
			while ($line = $result->fetchArray(SQLITE3_NUM)) {
				echo "\t<tr style='background-color:{$query[0]};'>\n";
				foreach ($line as $col_value) {
					echo "\t\t<td>$col_value</td>\n";
				}
				echo "\t</tr>\n";
			};
		};
		echo "</table>\n";
		*/


			// LIST FORMAT
			/* while ($line = $result->fetchArray(SQLITE3_NUM)) {
			echo "\t<div>\n";
			foreach ($line as $col_value) {
				echo "\t\t<td>$col_value</td>\n";
			}
			echo "\t</tr>\n";
		}
		echo "</table>\n"; */





			?>
			<br><br><br><br><br>

		</div>
		
	</div>

	<div class="footer">
		Content generated using PHP and SQLite. Contact Indigo#6290 on Discord for more.
	</div>

</body>

</html>