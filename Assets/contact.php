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

			<h1>CONTACT</h1>

			<p>This content is presented to standardize loadouts and asset implementations for Friday Night Fight missions.</p>
			<p><a href=https://discord.gg/y4Rygfd>Discord</a></p>
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