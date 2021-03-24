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



		.main tr:nth-child(odd) {
			background-color: #fff2e6;
		}

		.main tr:nth-child(even) {
			background-color: #ffe5cc;
		}

		.main tr:hover {
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

			<h1>OPFOR</h1>
			<!-- <p style='text-align:center'>To view more specific lists, select from the left.</p> -->

			<?php

			// DB Connect
			// sqlite
			$db = new SQLite3('fnfassets.db');


			?>


			<h2>Land/Sea Assets</h2>

			<?php

			$landQuery = "SELECT ASSETS.FACTION,
			ASSETS.DISPLAYNAME,
			ASSETS.NOTE,
			ASSETS.DRIVERSEATS,
			ASSETS.GUNNERSEATS,
			ASSETS.COMMANDERSEATS,
			ASSETS.FFVSEATS,
			ASSETS.PASSENGERSEATS,
			ASSETS.INITSCRIPT,
			DWEP1WEP.DISPLAYNAME AS DRIVERWEP1,
			DWEP1MAG.CALIBER AS DRIVERWEP1CALIBER,
			DWEP1MAG.AMMO AS DRIVERWEP1AMMO,
			ASSETS.DRIVERWEAPON1MAGCOUNT AS DRIVERWEP1MAGS,
			GWEP1WEP.DISPLAYNAME AS GUNNERWEP1,
			GWEP1MAG.CALIBER AS GUNNERWEP1CALIBER,
			GWEP1MAG.AMMO AS GUNNERWEP1AMMO,
			ASSETS.GUNNERWEAPON1MAGCOUNT AS GUNNERWEP1MAGS,
			GWEP2WEP.DISPLAYNAME AS GUNNERWEP2,
			GWEP2MAG.CALIBER AS GUNNERWEP2CALIBER,
			GWEP2MAG.AMMO AS GUNNERWEP2AMMO,
			ASSETS.GUNNERWEAPON2MAGCOUNT AS GUNNERWEP2MAGS,
			GWEP3WEP.DISPLAYNAME AS GUNNERWEP3,
			GWEP3MAG.CALIBER AS GUNNERWEP3CALIBER,
			GWEP3MAG.AMMO AS GUNNERWEP3AMMO,
			ASSETS.GUNNERWEAPON3MAGCOUNT AS GUNNERWEP3MAGS,
			CWEP1WEP.DISPLAYNAME AS COMMANDERWEP1,
			CWEP1MAG.CALIBER AS COMMANDERWEP1CALIBER,
			CWEP1MAG.AMMO AS COMMANDERWEP1AMMO,
			ASSETS.COMMANDERWEAPON1MAGCOUNT AS COMMANDERWEP1MAGS,
			CWEP2WEP.DISPLAYNAME AS COMMANDERWEP2,
			CWEP2MAG.CALIBER AS COMMANDERWEP2CALIBER,
			CWEP2MAG.AMMO AS COMMANDERWEP2AMMO,
			ASSETS.COMMANDERWEAPON2MAGCOUNT AS COMMANDERWEP2MAGS,
			CWEP3WEP.DISPLAYNAME AS COMMANDERWEP3,
			CWEP3MAG.CALIBER AS COMMANDERWEP3CALIBER,
			CWEP3MAG.AMMO AS COMMANDERWEP3AMMO,
			ASSETS.COMMANDERWEAPON3MAGCOUNT AS COMMANDERWEP3MAGS
		FROM ASSETS
		LEFT JOIN WEAPONS DWEP1WEP ON ASSETS.DRIVERWEAPON1 = DWEP1WEP.CLASSNAME
		LEFT JOIN MAGAZINES DWEP1MAG ON ASSETS.DRIVERWEAPON1MAG = DWEP1MAG.CLASSNAME
		LEFT JOIN WEAPONS GWEP1WEP ON ASSETS.GUNNERWEAPON1 = GWEP1WEP.CLASSNAME
		LEFT JOIN MAGAZINES GWEP1MAG ON ASSETS.GUNNERWEAPON1MAG = GWEP1MAG.CLASSNAME
		LEFT JOIN WEAPONS GWEP2WEP ON ASSETS.GUNNERWEAPON2 = GWEP2WEP.CLASSNAME
		LEFT JOIN MAGAZINES GWEP2MAG ON ASSETS.GUNNERWEAPON2MAG = GWEP2MAG.CLASSNAME
		LEFT JOIN WEAPONS GWEP3WEP ON ASSETS.GUNNERWEAPON3 = GWEP3WEP.CLASSNAME
		LEFT JOIN MAGAZINES GWEP3MAG ON ASSETS.GUNNERWEAPON3MAG = GWEP3MAG.CLASSNAME
		LEFT JOIN WEAPONS CWEP1WEP ON ASSETS.COMMANDERWEAPON1 = CWEP1WEP.CLASSNAME
		LEFT JOIN MAGAZINES CWEP1MAG ON ASSETS.COMMANDERWEAPON1MAG = CWEP1MAG.CLASSNAME
		LEFT JOIN WEAPONS CWEP2WEP ON ASSETS.COMMANDERWEAPON2 = CWEP2WEP.CLASSNAME
		LEFT JOIN MAGAZINES CWEP2MAG ON ASSETS.COMMANDERWEAPON2MAG = CWEP2MAG.CLASSNAME
		LEFT JOIN WEAPONS CWEP3WEP ON ASSETS.COMMANDERWEAPON3 = CWEP3WEP.CLASSNAME
		LEFT JOIN MAGAZINES CWEP3MAG ON ASSETS.COMMANDERWEAPON3MAG = CWEP3MAG.CLASSNAME
		WHERE ASSETS.PILOTSEATS = 0 AND ASSETS.FACTION = 'OPFOR'
		ORDER BY ASSETS.DISPLAYNAME;";


			// TABLE FORMAT
			/* 
		echo '<table border="0" cellspacing="2" cellpadding="2">';
		echo '<tr>
				<th> Faction </th>
				<th> Display Name </th>
				<th> Drivers </th>
				<th> Gunners </th>
				<th> Cmdrs </th>
				<th> FFV </th>
				<th> Pax </th>
			</tr>';



		$result = $db->query($landBluQuery);

		while ($line = $result->fetchArray(SQLITE3_BOTH)) {
			echo "\t<tr>\n";
			echo "\t\t<td>{$line[0]}</td>\n";
			echo "\t\t<td>{$line[1]}</td>\n";
			echo "\t\t<td>{$line[2]}</td>\n";
			echo "\t\t<td>{$line[3]}</td>\n";
			echo "\t\t<td>{$line[4]}</td>\n";
			echo "\t\t<td>{$line[5]}</td>\n";
			echo "\t\t<td>{$line[6]}</td>\n";
			echo "\t</tr>\n";
		};
		echo "</table>\n";

		echo "<br><br>";
 */
			echo "<div id=buttons>";
			$result = $db->query($landQuery);

			if (!$result) {
				echo "An error occurred.\n";
				exit;
			};

			while ($line = $result->fetchArray(SQLITE3_ASSOC)) {
				echo "<button class=accordion><b>{$line['displayname']}</b><br><br><span class=unitnote>{$line['note']}</span></button>";
				echo "<div class=panel>";
				echo "
		<ul>
			<li>Driver Seats: {$line["driverseats"]}</li>
			<li>Gunner Seats: {$line["gunnerseats"]}</li>
			<li>Commander Seats: {$line["commanderseats"]}</li>
			<li>Firing-from-Vehicle Seats: {$line["ffvseats"]}</li>
			<li>Passenger Seats: {$line["passengerseats"]}</li>
			<li>Weapons:</li>
			<ul>
			";
				if ($line["DRIVERWEP1"]) {
					echo "
				<li>Driver:
							<ul>
								<li>{$line["DRIVERWEP1"]} firing {$line["DRIVERWEP1CALIBER"]} [{$line["GUNNERWEP1AMMO"]} x {$line["DRIVERWEP1MAGS"]}]</li>
							</ul>
				</li>";
				};
				if ($line["GUNNERWEP1"]) {
					echo "
				<li>Gunner:
							<ul>
								<li>{$line["GUNNERWEP1"]} firing {$line["GUNNERWEP1CALIBER"]} [{$line["GUNNERWEP1AMMO"]} x {$line["GUNNERWEP1MAGS"]}]</li>
								";
				};
				if ($line["GUNNERWEP2"]) {
					echo "<li>{$line["GUNNERWEP2"]} firing {$line["GUNNERWEP2CALIBER"]} [{$line["GUNNERWEP2AMMO"]} x {$line["GUNNERWEP2MAGS"]}]</li>";
				};
				if ($line["GUNNERWEP3"]) {
					echo "<li>{$line["GUNNERWEP3"]} firing {$line["GUNNERWEP3CALIBER"]} [{$line["GUNNERWEP3AMMO"]} x {$line["GUNNERWEP3MAGS"]}]</li>";
				};
				if ($line["GUNNERWEP1"]) {
					echo "</ul></li>";
				};
				if ($line["COMMANDERWEP1"]) {
					echo "
				<li>Commander:
							<ul>
								<li>{$line["COMMANDERWEP1"]} firing {$line["COMMANDERWEP1CALIBER"]} [{$line["COMMANDERWEP1AMMO"]} x {$line["COMMANDERWEP1MAGS"]}]</li>
								";
				};
				if ($line["COMMANDERWEP2"]) {
					echo "
				<li>{$line["COMMANDERWEP2"]} firing {$line["COMMANDERWEP2CALIBER"]} [{$line["COMMANDERWEP2AMMO"]} x {$line["COMMANDERWEP2MAGS"]}]</li>
								";
				};
				if ($line["COMMANDERWEP3"]) {
					echo "
				<li>{$line["COMMANDERWEP3"]} firing {$line["COMMANDERWEP3CALIBER"]} [{$line["COMMANDERWEP3AMMO"]} x {$line["COMMANDERWEP3MAGS"]}]</li>
				";
				};
				if ($line["COMMANDERWEP1"]) {
					echo "</ul>
				</li>";
				};
				echo "
			</ul>
			<li>InitScript:</li>
			<ul>
				<li>{$line["initscript"]}</li>
			</ul>
		</ul>
";
				// echo var_dump($line);
				echo "</div><br>";
			};
			echo "</div>";
			// LIST FORMAT





			?>

			<h2>Air Assets</h2>

			<?php

			$airQuery = "SELECT ASSETS.FACTION,
	ASSETS.DISPLAYNAME,
	ASSETS.NOTE,
	ASSETS.PILOTSEATS,
	ASSETS.FFVSEATS,
	ASSETS.GUNNERSEATS,
	ASSETS.PASSENGERSEATS,
	ASSETS.INITSCRIPT,
	PWEP1WEP.DISPLAYNAME AS PILOTWEP1,
	PWEP1MAG.CALIBER AS PILOTWEP1CALIBER,
	PWEP1MAG.AMMO AS PILOTWEP1AMMO,
	ASSETS.PILOTWEAPON1MAGCOUNT AS PILOTWEP1MAGS,
	PWEP2WEP.DISPLAYNAME AS PILOTWEP2,
	PWEP2MAG.CALIBER AS PILOTWEP2CALIBER,
	PWEP2MAG.AMMO AS PILOTWEP2AMMO,
	ASSETS.PILOTWEAPON2MAGCOUNT AS PILOTWEP2MAGS,
	PWEP3WEP.DISPLAYNAME AS PILOTWEP3,
	PWEP3MAG.CALIBER AS PILOTWEP3CALIBER,
	PWEP3MAG.AMMO AS PILOTWEP3AMMO,
	ASSETS.PILOTWEAPON3MAGCOUNT AS PILOTWEP3MAGS,
	GWEP1WEP.DISPLAYNAME AS GUNNERWEP1,
	GWEP1MAG.CALIBER AS GUNNERWEP1CALIBER,
	GWEP1MAG.AMMO AS GUNNERWEP1AMMO,
	ASSETS.GUNNERWEAPON1MAGCOUNT AS GUNNERWEP1MAGS,
	GWEP2WEP.DISPLAYNAME AS GUNNERWEP2,
	GWEP2MAG.CALIBER AS GUNNERWEP2CALIBER,
	GWEP2MAG.AMMO AS GUNNERWEP2AMMO,
	ASSETS.GUNNERWEAPON2MAGCOUNT AS GUNNERWEP2MAGS,
	GWEP3WEP.DISPLAYNAME AS GUNNERWEP3,
	GWEP3MAG.CALIBER AS GUNNERWEP3CALIBER,
	GWEP3MAG.AMMO AS GUNNERWEP3AMMO,
	ASSETS.GUNNERWEAPON3MAGCOUNT AS GUNNERWEP3MAGS
FROM ASSETS
	LEFT JOIN WEAPONS PWEP1WEP ON ASSETS.PILOTWEAPON1 = PWEP1WEP.CLASSNAME
	LEFT JOIN MAGAZINES PWEP1MAG ON ASSETS.PILOTWEAPON1MAG = PWEP1MAG.CLASSNAME
	LEFT JOIN WEAPONS PWEP2WEP ON ASSETS.PILOTWEAPON2 = PWEP2WEP.CLASSNAME
	LEFT JOIN MAGAZINES PWEP2MAG ON ASSETS.PILOTWEAPON2MAG = PWEP2MAG.CLASSNAME
	LEFT JOIN WEAPONS PWEP3WEP ON ASSETS.PILOTWEAPON3 = PWEP3WEP.CLASSNAME
	LEFT JOIN MAGAZINES PWEP3MAG ON ASSETS.PILOTWEAPON3MAG = PWEP3MAG.CLASSNAME
	LEFT JOIN WEAPONS GWEP1WEP ON ASSETS.GUNNERWEAPON1 = GWEP1WEP.CLASSNAME
	LEFT JOIN MAGAZINES GWEP1MAG ON ASSETS.GUNNERWEAPON1MAG = GWEP1MAG.CLASSNAME
	LEFT JOIN WEAPONS GWEP2WEP ON ASSETS.GUNNERWEAPON2 = GWEP2WEP.CLASSNAME
	LEFT JOIN MAGAZINES GWEP2MAG ON ASSETS.GUNNERWEAPON2MAG = GWEP2MAG.CLASSNAME
	LEFT JOIN WEAPONS GWEP3WEP ON ASSETS.GUNNERWEAPON3 = GWEP3WEP.CLASSNAME
	LEFT JOIN MAGAZINES GWEP3MAG ON ASSETS.GUNNERWEAPON3MAG = GWEP3MAG.CLASSNAME
WHERE ASSETS.PILOTSEATS > 0 AND ASSETS.FACTION = 'OPFOR'
ORDER BY ASSETS.DISPLAYNAME";

			$result = $db->query($airQuery);

			if (!$result) {
				echo "An error occurred.\n";
				exit;
			};

			echo "<div id=buttons>";

			while ($line = $result->fetchArray(SQLITE3_ASSOC)) {
				echo "<button class=accordion><b>{$line['displayname']}</b><br><br><span class=unitnote>{$line['note']}</span></button>";
				echo "<div class=panel>";
				echo "
		<ul>
			<li>Pilot Seats: {$line["pilotseats"]}</li>
			<li>Gunner Seats: {$line["gunnerseats"]}</li>
			<li>Firing-from-Vehicle Seats: {$line["ffvseats"]}</li>
			<li>Passenger Seats: {$line["passengerseats"]}</li>
			<li>Weapons:</li>
			<ul>
			";
				if ($line["PILOTWEP1"]) {
					echo "
				<li>Pilot:
							<ul>
								<li>{$line["PILOTWEP1"]} firing {$line["PILOTWEP1CALIBER"]} [{$line["PILOTWEP1AMMO"]} x {$line["PILOTWEP1MAGS"]}]</li>
								";
				};
				if ($line["PILOTWEP2"]) {
					echo "
				<li>{$line["PILOTWEP2"]} firing {$line["PILOTWEP2CALIBER"]} [{$line["PILOTWEP2AMMO"]} x {$line["PILOTWEP2MAGS"]}]</li>
								";
				};
				if ($line["PILOTWEP3"]) {
					echo "
				<li>{$line["PILOTWEP3"]} firing {$line["PILOTWEP3CALIBER"]} [{$line["PILOTWEP3AMMO"]} x {$line["PILOTWEP3MAGS"]}]</li>
				";
				};
				if ($line["PILOTWEP1"]) {
					echo "</ul>
				</li>";
				};
				if ($line["GUNNERWEP1"]) {
					echo "
				<li>Gunner:
							<ul>
								<li>{$line["GUNNERWEP1"]} firing {$line["GUNNERWEP1CALIBER"]} [{$line["GUNNERWEP1AMMO"]} x {$line["GUNNERWEP1MAGS"]}]</li>
								";
				};
				if ($line["GUNNERWEP2"]) {
					echo "<li>{$line["GUNNERWEP2"]} firing {$line["GUNNERWEP2CALIBER"]} [{$line["GUNNERWEP2AMMO"]} x {$line["GUNNERWEP2MAGS"]}]</li>";
				};
				if ($line["GUNNERWEP3"]) {
					echo "<li>{$line["GUNNERWEP3"]} firing {$line["GUNNERWEP3CALIBER"]} [{$line["GUNNERWEP3AMMO"]} x {$line["GUNNERWEP3MAGS"]}]</li>";
				};
				if ($line["GUNNERWEP1"]) {
					echo "</ul></li>";
				};

				echo "
			</ul>
			<li>InitScript:</li>
			<ul>
				<li>{$line["initscript"]}</li>
			</ul>
		</ul>
";
				// echo var_dump($line);
				echo "</div><br>";
			};



			?>

			<br>
			<br>
			<br>
			<br>
			<br>
			<br>



		</div>

	</div>
	<div class="footer">
		Content generated using PHP and SQLite. Contact Indigo#6290 on Discord for more.
	</div>



	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				/* Toggle between adding and removing the "active" class,
				to highlight the button that controls the panel */
				this.classList.toggle("active");

				/* Toggle between hiding and showing the active panel */
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				};
			});
		}
	</script>

</body>

</html>