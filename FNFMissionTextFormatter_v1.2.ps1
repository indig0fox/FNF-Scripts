<#

.SYNOPSIS

This script prompts for information about a specific mission and compiles an appropriate folder name and lobby description.

.DESCRIPTION

3rd Party Tools Used: 
	- [None]

This script allows a mission maker to quickly compile a name and lobby description matching FNF standards by providing prompted information about their mission, simplifying the submission pipeline.

__How to Use:__

	1. Left-click the script to select it, then Right-click it and select Run with Powershell.
	_If you don't see the Run with Powershell option, check your default file associations for .ps1 files_

.NOTES

Script Process:
	1. Prompts user for information about the mission.
	2. Compiles and presents information in structured format.
	3. Copies resulting mission name to the user's clipboard.

Author: IndigoFox
Website: indifox.info
Email: indifox926@gmail.com
Discord: IndigoFox#6290

#>


[CmdletBinding()]
param ()


function Show-ListMenu {

	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline = $True)]
		[Array]
		$List,
		[Parameter()]
		[String]
		$Title,
		[Parameter()]
		[Int]
		$MaxItems = 10,
		[Parameter()]
		[Int]
		$MaxWidth = 78
	)

	BEGIN {

		# MaxWidth 98 is default wide title

		$MaxWidth = $MaxWidth - 2

		if ($PSBoundParameters.ContainsKey("Title") -and $List) {
			# Title included and list is param
			$LongestItemLength = ($List | Measure-Object -Maximum -Property Length).Maximum + 16
			if ($Title.Length -gt $LongestItemLength) {
				$MaxWidth = $Title.Length + 6
			} else {
				$MaxWidth = $LongestItemLength
			}
		} elseif ($PSBoundParameters.ContainsKey("Title") -and !$List) {
			# Title included and list is pipeline
			
		} elseif (!$PSBoundParameters.ContainsKey("Title") -and $List) {
			# Title not provided and list is param
			$LongestItemLength = ($List | Measure-Object -Maximum -Property Length).Maximum + 16
			$MaxWidth = $LongestItemLength
		} elseif (!$PSBoundParameters.ContainsKey("Title") -and !$List) {
			# Title not provided and list is pipeline
		}


		$Title = $Title.PadLeft((($MaxWidth - $Title.Length) / 2) + $Title.Length)
		$Title = $Title.PadRight($MaxWidth)
		$StartBorder = ""
		$StartBorder = $StartBorder.PadRight($MaxWidth, "═")
		$StartBorder = "╔$StartBorder╗"
		$HeaderBorder = ""
		$HeaderBorder = $HeaderBorder.PadRight($MaxWidth, "═")
		$HeaderBorder = "╟$HeaderBorder╢"
		$EndBorder = ""
		$EndBorder = $EndBorder.PadLeft($MaxWidth, "═")
		$EndBorder = "╚$EndBorder╝"


		if ($PSBoundParameters.ContainsKey("Title")) {
			Write-Host -ForegroundColor Gray -BackgroundColor Black $StartBorder
			Write-Host -ForegroundColor Gray -BackgroundColor Black "║$Title║"
		}

		$HeaderBorderPosted = $False

		$n1 = 1
		$n2 = 0
	}


	PROCESS {
		
		if ($List.Count -gt 1) {
			# List provided as parameter
			Write-Debug "Param"

			if (!$HeaderBorderPosted -and $PSBoundParameters.ContainsKey("Title")) {
				Write-Host -ForegroundColor Gray -BackgroundColor Black $HeaderBorder
				$HeaderBorderPosted = $True
			} elseif (!$HeaderBorderPosted -and !$PSBoundParameters.ContainsKey("Title")) {
				Write-Host -ForegroundColor Gray -BackgroundColor Black $StartBorder
				$HeaderBorderPosted = $True
			}

			for ($i = 0; $i -le ($MaxItems - 1); $i++) {
				if ($List[$i]) {
					$Line = "    $n1. $($List[$i])"
					$Line = $Line.PadRight($MaxWidth)
					Write-Host -ForegroundColor Gray -BackgroundColor Black "║$Line║"
					$n1 += 1
				}
			}
		} else {
			if ($n1 -eq 1 -and $List -and $PSBoundParameters.ContainsKey("Title")) {
				# List provided via pipeline with title
				Write-Debug "Pipeline n1 = 1 and list with title"
				Write-Host -ForegroundColor Gray -BackgroundColor Black $HeaderBorder
			} elseif ($n1 -eq 1 -and $List -and !$PSBoundParameters.ContainsKey("Title")) {
				# List provided via pipeline without title
				Write-Debug "Pipeline n1 = 1 and list without title"
				Write-Host -ForegroundColor Gray -BackgroundColor Black $StartBorder
			} elseif (!$List) {
				# Title only, no selections input
				Write-Debug "Pipeline No list"
				Write-Host -ForegroundColor Gray -BackgroundColor Black $EndBorder
				return
			}

			if ($n2 -ge $MaxItems) { return } else {
				Write-Debug "Pipeline n2 gt maxItems"
				$Line = "    $n1. $($List)"
				$Line = $Line.PadRight($MaxWidth)
				Write-Host -ForegroundColor Gray -BackgroundColor Black "║$Line║"
				$n1 += 1
				$n2 += 1
			}
		}

	}

	END {
		if ($List.Count -gt 0) { 
			Write-Host -ForegroundColor Gray -BackgroundColor Black $EndBorder
		}
	}
}


function Write-HostCenter {

	[CmdletBinding()]

	param (
		[Parameter()]
		[String]
		$Message
	)

	Write-Host ("{0}{1}" -f (' ' * (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Floor($Message.Length / 2)))), $Message)
}


$GameModeChoices = @(
	"adSector",
	"connection",
	"ctf",
	"destroy",
	"nSector",
	"rush",
	"uplink"
)
$SegmentChoices = @(
	"NA",
	"EU",
	"Any"
)
$SideChoices = @(
	"BLU",
	"OPF",
	"IND"
)

$Version = ($PSCommandPath -split 'v')[-1] -replace '.ps1',''

$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Gray"
$Host.UI.RawUI.WindowTitle = "FNF Mission Text Formatter v$Version"
Clear-Host


function Show-Header {
	Write-Host
	Show-ListMenu -Title "FRIDAY NIGHT FIGHT -- Mission Name and Lobby Description Formatter" -MaxWidth 97
	Write-Host -ForegroundColor DarkCyan -BackgroundColor Black "This script will prompt you for values and automatically compile an appropriate mission filename."
	Write-Host -ForegroundColor DarkGray -BackgroundColor Black ("For mission making issues/questions/suggestions, contact Nemesis#5884").PadRight(97)
	Write-Host -ForegroundColor DarkGray -BackgroundColor Black ("For script issues/questions/suggestions, contact Indigo#6290").PadRight(97)
	Write-Host
	return
}


#####
Show-Header

$TaskSelections = @(
	"Generate mission name"
	"Generate mission description (for lobby)"
)



Show-ListMenu -Title "What would you like to do?" -List $TaskSelections
$TaskSelection = Read-Host "Selection"

Clear-Host
Show-Header

switch ($TaskSelection) {

	"1" {

		Write-Host
		Show-ListMenu -Title "FNF Mission Name Formatter"
		$AuthorName = Read-Host "Author Name"

		do {
			try {
				[ValidatePattern('^[A-z0-9]+$')] $MissionName = Read-Host "Mission Name (no '_','.',spaces)"
			} catch {}
		} until ($MissionName)

		do {
			try {
				[ValidatePattern('^\d{1,2}$')] $Version = Read-Host "Version (ex. 1)"
			} catch {}
		} until ($Version)


		do {
			try {
				Write-Host
				Show-ListMenu -Title "FNF GAME MODES" -List $GameModeChoices
				$GameModeSelection = Read-Host "Select the active game mode"
				$GameMode = $GameModeChoices[$GameModeSelection - 1]
			} catch {}
		} until ($GameMode)


		do {
			try {
				Write-Host
				Show-ListMenu -Title "SEGMENT CHOICES" -List $SegmentChoices
				$PrefSegmentSelection = Read-Host "Select the segment your mission should be played in"
				$PrefSegment = $SegmentChoices[$PrefSegmentSelection - 1]
			} catch {}
		} until ($PrefSegment)


		$FileName = "FNF_{0}_{1}_{2}_v{3}_{4}" -f @($AuthorName, $MissionName, $GameMode, $Version, $PrefSegment)
		$LongFileName = $FileName + "[.map.pbo]"

		Write-Host
		Write-Host "Your filename is: " -NoNewline
		Write-Host -ForegroundColor Green "$LongFileName"
		$FileName | Clip
		Write-Host "It's been copied to your clipboard for convenience."
		Write-Host
		Write-Host
		Pause
	}

	"2" {

		Show-ListMenu -Title "FNF Lobby Text Formatter"


		# Select game mode
		do {
			try {
				Write-Host
				Show-ListMenu -Title "FNF GAME MODES" -List $GameModeChoices
				$GameModeSelection = Read-Host "Select the active game mode"
				$GameModeRaw = ($GameModeChoices[$GameModeSelection - 1]).ToUpper()
				Write-Host "Saved game mode as $($GameModeRaw)."
			} catch {}
		} until ($GameModeRaw)
		# Count of objectives present (terminals, sectors, caches)
		if ($GameModeRaw -ne "ctf") {
			do {
				try {
					Write-Host
					[ValidatePattern('[123]')] $GameModeObjCount = Read-Host "How many objectives are present? (1-3)"
					$GameMode = $GameModeRaw + "($GameModeObjCount)"
				} catch {}
			} until ($GameModeObjCount)
		}


		# Select sides present
		$SidesPresent = [PSCustomObject] @{
			"ATK" = [Array] @();
			"DEF" = [Array] @();
		}

		# Set up what factions are doing what
		if ($GameModeRaw -ne "NSECTOR") {
			# Not nSector

			# Get attacker
			Write-Host
			Show-ListMenu -Title "SIDE CHOICES" -List $SideChoices
			$ATKSelection = [Int](Read-Host "Select the attacking faction")
			$SidesPresent.ATK += [PSCustomObject] @{
				"Name"   = $SideChoices[$ATKSelection - 1];
				"Assets" = "";
			}
			Write-Host "Saved $($SideChoices[$ATKSelection - 1]) as the attacker."
			
			Write-Host
			$ATKAdv = Read-Host "Enter the desired % advantage for $($SidesPresent.ATK[0].Name)"

			Write-Host "Saved $($ATKAdv)% attacker advantage."

			# Get defender
			Write-Host
			Show-ListMenu -Title "SIDE CHOICES" -List $SideChoices

			$DEFSelection = [Int](Read-Host "Select the defending faction")
			$SidesPresent.DEF += [PSCustomObject] @{
				"Name"   = $SideChoices[$DEFSelection - 1];
				"Assets" = "";
			}
			Write-Host "Saved $($SideChoices[$DEFSelection - 1]) as the defender."
			Write-Host

		} else {

			# nSector
			Write-Host "Neutral sector game mode selected."
			
			# Check if 2 or 3 factions playing
			do {
				try {
					[ValidatePattern('[23]')] $NumOfFactions = Read-Host "Number of active factions (2-3)"
				} catch {}
			} until ($NumOfFactions)

			switch ($NumOfFactions) {

				"2" {

					# If two, which one NOT playing?
					Write-Host
					Show-ListMenu -Title "SIDE CHOICES" -List $SideChoices

					$AbsentFaction = [Int](Read-Host "Select the faction that IS NOT present")
					$AbsentFaction = $SideChoices[$AbsentFaction - 1]

					ForEach ($Faction in ($SideChoices | Where-Object { $_ -ne $AbsentFaction })) {
						# Add other factions to attackers
						$SidesPresent.ATK += [PSCustomObject] @{
							"Name"   = $Faction;
							"Assets" = "";
						}
					}
				}

				"3" {
					ForEach ($Faction in $SideChoices) {
						# Add all factions to attackers
						$SidesPresent.ATK += [PSCustomObject] @{
							"Name"   = $Faction;
							"Assets" = "";
						}
					}
				}
			}
		}


		# Prompt for assets for each faction
		ForEach ($Faction in $SidesPresent.ATK) {
			Write-Host
			Show-ListMenu -Title "FACTION ASSET DECLARATIONS"
			Write-Host "Examples:"
			Write-Host "  5x M1151(1xM240, 2xLRAS/M2) 2x Quads, transport"
			Write-Host "  4x GAZ(2xPKP), 2x Quads, Transport"
			Write-Host

			$Faction.Assets = Read-Host "$($Faction.Name) assets"
		}
		Write-Debug "SidesPresent.DEF.Count = $($SidesPresent.DEF.Count)"
		if ($SidesPresent.DEF.Count -gt 0) {
			ForEach ($Faction in $SidesPresent.DEF) {
	
				$Faction.Assets = Read-Host "$($Faction.Name) assets"
			}
		}



		# Compile string


		<# 
		Format: “Gamemode(x) // ATK: Faction1 X% advantage - DEF: Faction2 //
	Faction1 assets: // Faction2 assets”
		Example: “UPLINK(3) // ATK: BLUE 15% advantage - DEF: OPFOR // BLUE: 5x
	M1151(1xM240, 2xLRAS/M2) 2x Quads, transport // OPFOR: 4x GAZ(2xPKP),
2x Quads, Transport”
5x M1151(1xM240, 2xLRAS/M2) 2x Quads, transport
4x GAZ(2xPKP), 2x Quads, Transport
		#>
		

		# Add gamemode
		$DescString = "$($GameMode) // ATK: "
		
		# Add attackers
		ForEach ($Side in $SidesPresent.ATK) {
			$DescString += "$($Side.Name) "
		}

		# Add advantage
		if ($ATKAdv) { $DescString += "$($ATKAdv)% adv " }

		# Add defenders
		if ($SidesPresent.DEF.Count -gt 0) {
			$DescString += "- DEF: "
			ForEach ($Side in $SidesPresent.DEF) {
				$DescString += "$($Side.Name) "
			}
			$DescString += "// "
		} else {
			$DescString += "// "
		}

		# Add attacker assets
		ForEach ($Faction in $SidesPresent.ATK) {
			$DescString += "$($Faction.Name): $($Faction.Assets) // "
		}

		# Add defender assets
		if ($SidesPresent.DEF.Count -gt 0) {
			ForEach ($Faction in $SidesPresent.DEF) {
				Write-Debug "$Faction"
				$DescString += "$($Faction.Name): $($Faction.Assets) // "
			}
		}


		# Output

		Write-Host
		Write-Host "Your mission description is: "
		Write-Host -ForegroundColor Green $DescString
		$DescString | Clip
		Write-Host "It's been copied to your clipboard for convenience."
		Write-Host
		Write-Host
		Pause
	}

	default {
		Write-Host
		Write-Host "Invalid selection"
		Start-Sleep 3
	}
}

# 5x GAZ(3xPKM), 2x BTR-80, 2x Quads, Transport
# 3x M1151(2x M2), 1x M2 static, Transport

# SIG # Begin signature block
# MIIR5QYJKoZIhvcNAQcCoIIR1jCCEdICAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUvEjNtf2JMJA9nVy86urBDEra
# mJqggg1QMIIDFTCCAf2gAwIBAgIQarNwqALG/45HOA0xJfnsbTANBgkqhkiG9w0B
# AQsFADAWMRQwEgYDVQQDDAtJbmRpZ28jNjI5MDAeFw0yMTAzMTIxMDM4MThaFw0y
# MjAzMTIxMDU4MThaMBYxFDASBgNVBAMMC0luZGlnbyM2MjkwMIIBIjANBgkqhkiG
# 9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2qAtyT1uulJIAYesEd816AT3/QQb/J5rxx9m
# ZWrrFXZNWDPCk887fgSRerI6pBwuq5oA7IP7llwEOZjkEo3EiZu1iqztNOwbV4MJ
# v/Nd0MpqWHOOAATimBawUAhF+cKoKWQ7teLEEaVT4LQsNVR7WKptSv5xfTjXKbej
# Dv94XALj9T4CMlpyFsFNG9F4WyQ1dXOrNVcqZipjT2CmEuIQKTUUkPtOxgpfKWwu
# t7VgDdUwH7+A98Rju3Mtdvjcvv3WCc8OI17/0o0BYuVHhFAidD+aS7qXFFY5dHT+
# WXqa6zEcv7ZnxqEoBan/I05dJ8UG70NW56rce5nW1u4AgayHPQIDAQABo18wXTAO
# BgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwFwYDVR0RBBAwDoIM
# aW5kaWZveC5pbmZvMB0GA1UdDgQWBBTFGaHldHGIj5xmmUwhJRWZ+eJ+tzANBgkq
# hkiG9w0BAQsFAAOCAQEA1Het5C1AOE8jsiOD2QPsGS0ajsizu1oAE1tadRj57ePA
# fTa0odJZXqSF+3Ch79ccPIHDq3BqFMOluiPTo0lR0iqPRXH5gdnfsQVuLZZvbjaq
# STtP6fQKj1cNAF+QatEieqG/QudW7k8nEG23sg1r+swvTjsSe+dKncnHNesXWdg3
# uwe7yeulrqG/q8tilDzNyJIOHpxOmcEURBp+14VQTVnAxloib/wC8g1YT5t9RJUy
# Qh6PoiBSnW4oPwhvw5LhSaKFXCGcIrY2CSl0NJtRmnzX+VG+S84Qlij6t0u61K/c
# TAzfbBODVKEpQeS+LSq6yMymTX2M9xxsDZj0qfgECjCCBP4wggPmoAMCAQICEA1C
# SuC+Ooj/YEAhzhQA8N0wDQYJKoZIhvcNAQELBQAwcjELMAkGA1UEBhMCVVMxFTAT
# BgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEx
# MC8GA1UEAxMoRGlnaUNlcnQgU0hBMiBBc3N1cmVkIElEIFRpbWVzdGFtcGluZyBD
# QTAeFw0yMTAxMDEwMDAwMDBaFw0zMTAxMDYwMDAwMDBaMEgxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjEgMB4GA1UEAxMXRGlnaUNlcnQgVGlt
# ZXN0YW1wIDIwMjEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDC5mGE
# Z8WK9Q0IpEXKY2tR1zoRQr0KdXVNlLQMULUmEP4dyG+RawyW5xpcSO9E5b+bYc0V
# kWJauP9nC5xj/TZqgfop+N0rcIXeAhjzeG28ffnHbQk9vmp2h+mKvfiEXR52yeTG
# dnY6U9HR01o2j8aj4S8bOrdh1nPsTm0zinxdRS1LsVDmQTo3VobckyON91Al6GTm
# 3dOPL1e1hyDrDo4s1SPa9E14RuMDgzEpSlwMMYpKjIjF9zBa+RSvFV9sQ0kJ/SYj
# U/aNY+gaq1uxHTDCm2mCtNv8VlS8H6GHq756WwogL0sJyZWnjbL61mOLTqVyHO6f
# egFz+BnW/g1JhL0BAgMBAAGjggG4MIIBtDAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0T
# AQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBBBgNVHSAEOjA4MDYGCWCG
# SAGG/WwHATApMCcGCCsGAQUFBwIBFhtodHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9D
# UFMwHwYDVR0jBBgwFoAU9LbhIB3+Ka7S5GGlsqIlssgXNW4wHQYDVR0OBBYEFDZE
# ho6kurBmvrwoLR1ENt3janq8MHEGA1UdHwRqMGgwMqAwoC6GLGh0dHA6Ly9jcmwz
# LmRpZ2ljZXJ0LmNvbS9zaGEyLWFzc3VyZWQtdHMuY3JsMDKgMKAuhixodHRwOi8v
# Y3JsNC5kaWdpY2VydC5jb20vc2hhMi1hc3N1cmVkLXRzLmNybDCBhQYIKwYBBQUH
# AQEEeTB3MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wTwYI
# KwYBBQUHMAKGQ2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFNI
# QTJBc3N1cmVkSURUaW1lc3RhbXBpbmdDQS5jcnQwDQYJKoZIhvcNAQELBQADggEB
# AEgc3LXpmiO85xrnIA6OZ0b9QnJRdAojR6OrktIlxHBZvhSg5SeBpU0UFRkHefDR
# BMOG2Tu9/kQCZk3taaQP9rhwz2Lo9VFKeHk2eie38+dSn5On7UOee+e03UEiifuH
# okYDTvz0/rdkd2NfI1Jpg4L6GlPtkMyNoRdzDfTzZTlwS/Oc1np72gy8PTLQG8v1
# Yfx1CAB2vIEO+MDhXM/EEXLnG2RJ2CKadRVC9S0yOIHa9GCiurRS+1zgYSQlT7Lf
# ySmoc0NR2r1j1h9bm/cuG08THfdKDXF+l7f0P4TrweOjSaH6zqe/Vs+6WXZhiV9+
# p7SOZ3j5NpjhyyjaW4emii8wggUxMIIEGaADAgECAhAKoSXW1jIbfkHkBdo2l8IV
# MA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2Vy
# dCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lD
# ZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0xNjAxMDcxMjAwMDBaFw0zMTAxMDcx
# MjAwMDBaMHIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAX
# BgNVBAsTEHd3dy5kaWdpY2VydC5jb20xMTAvBgNVBAMTKERpZ2lDZXJ0IFNIQTIg
# QXNzdXJlZCBJRCBUaW1lc3RhbXBpbmcgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQC90DLuS82Pf92puoKZxTlUKFe2I0rEDgdFM1EQfdD5fU1ofue2
# oPSNs4jkl79jIZCYvxO8V9PD4X4I1moUADj3Lh477sym9jJZ/l9lP+Cb6+NGRwYa
# VX4LJ37AovWg4N4iPw7/fpX786O6Ij4YrBHk8JkDbTuFfAnT7l3ImgtU46gJcWvg
# zyIQD3XPcXJOCq3fQDpct1HhoXkUxk0kIzBdvOw8YGqsLwfM/fDqR9mIUF79Zm5W
# YScpiYRR5oLnRlD9lCosp+R1PrqYD4R/nzEU1q3V8mTLex4F0IQZchfxFwbvPc3W
# Te8GQv2iUypPhR3EHTyvz9qsEPXdrKzpVv+TAgMBAAGjggHOMIIByjAdBgNVHQ4E
# FgQU9LbhIB3+Ka7S5GGlsqIlssgXNW4wHwYDVR0jBBgwFoAUReuir/SSy4IxLVGL
# p6chnfNtyA8wEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwEwYD
# VR0lBAwwCgYIKwYBBQUHAwgweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQwgYEG
# A1UdHwR6MHgwOqA4oDaGNGh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
# dEFzc3VyZWRJRFJvb3RDQS5jcmwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0
# LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcmwwUAYDVR0gBEkwRzA4Bgpg
# hkgBhv1sAAIEMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNv
# bS9DUFMwCwYJYIZIAYb9bAcBMA0GCSqGSIb3DQEBCwUAA4IBAQBxlRLpUYdWac3v
# 3dp8qmN6s3jPBjdAhO9LhL/KzwMC/cWnww4gQiyvd/MrHwwhWiq3BTQdaq6Z+Cei
# Zr8JqmDfdqQ6kw/4stHYfBli6F6CJR7Euhx7LCHi1lssFDVDBGiy23UC4HLHmNY8
# ZOUfSBAYX4k4YU1iRiSHY4yRUiyvKYnleB/WCxSlgNcSR3CzddWThZN+tpJn+1Nh
# iaj1a5bA9FhpDXzIAbG5KHW3mWOFIoxhynmUfln8jA/jb7UBJrZspe6HUSHkWGCb
# ugwtK22ixH67xCUrRwIIfEmuE7bhfEJCKMYYVs9BNLZmXbZ0e/VWMyIvIjayS6JK
# ldj1po5SMYID/zCCA/sCAQEwKjAWMRQwEgYDVQQDDAtJbmRpZ28jNjI5MAIQarNw
# qALG/45HOA0xJfnsbTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAA
# oQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4w
# DAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUigQ+/vMgR/ezxJLPuZvCpJr6
# +ecwDQYJKoZIhvcNAQEBBQAEggEAZOJq31GO2X54YAhuBN8JoUrLMqAwXCQLLStQ
# at+U84VAFxHq6A/aVjj3tj1mxPJv4Kznt41Q2bp1nv4DX+Oa/Coh13WpGfwuIk14
# wAhloriwANk90GDZhUucQg+dr9e4uBCYc8e8JU8GOUj8WNPkRruVz1eIkhKjmcOT
# bA23FwOY3I/Yw2NGWU9m+wEWBx0LI1DYlWJP+dmz2xDdpkh4ZwI0m43ljLXhEhSX
# FwWppGYpQ4cAHBn0SbU/4CKDuVYCtQzkxcDhyl17B+aaeb+8rO2IXMQxwGRI8ybW
# gDmKRIKb8XZK1tnlsZ1NxSsipUuPpG97QdjbnS8rq+mNqGnXiqGCAjAwggIsBgkq
# hkiG9w0BCQYxggIdMIICGQIBATCBhjByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
# RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQD
# EyhEaWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQgVGltZXN0YW1waW5nIENBAhANQkrg
# vjqI/2BAIc4UAPDdMA0GCWCGSAFlAwQCAQUAoGkwGAYJKoZIhvcNAQkDMQsGCSqG
# SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwMzI0MTIzNzAzWjAvBgkqhkiG9w0B
# CQQxIgQghbqXyWAYEOat9znYSy60vVB2OiCtiFOMFNVa1yMQ420wDQYJKoZIhvcN
# AQEBBQAEggEAcJZwK8f6L38UiLdBJxcl+/TRs0GDzi6y4mFYzTxPk56Ib4d9QrFq
# OXaYdjkH/HunkjeQ3PVHPr24/dFLT114B1erplQwWuWvlfPncwX936uVOkwMPRMp
# Df6zk5ETxY6l8X8K1P/7CJt4pRblTl0dgNOV9xH7k7fQbTJWe+DtVP5PwjcxJh6c
# cgAl2LKrX+dHM2gpVUttg/7Ei2L+hR6ctRjQGtySIbRFKEwKkJD6FV9lB+IxF1Lr
# B3wN0zOYn1S1+5I4zuRTimd091Hh27uSGQWDLZsu8jhPLmVZJoR4SUROZtfolXmR
# Qs8ZMSW1C80EBxBZb9mxebJgWxUoGVtUig==
# SIG # End signature block
