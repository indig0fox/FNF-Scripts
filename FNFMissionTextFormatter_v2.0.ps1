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
	1. Launches a XAML-driven WPF form allowing custom input and parsing the resulting mission name and description in real-time.

Author: IndigoFox
Website: indifox.info
Email: indifox926@gmail.com
Discord: IndigoFox#6290

#>


$Version = ($PSCommandPath -split 'v')[-1] -replace '.ps1', ''

$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Gray"
$Host.UI.RawUI.WindowTitle = "FNF Mission Text Formatter v$Version"
Clear-Host



. ".\Forms\Form_MissionTextFormatter_Main.ps1"

# OUTPUT
function Set-OutputData {

	[System.Collections.ArrayList] $NameOut = @("FNF")
	[void] $NameOut.Add($WPFtxtAuthor.Text)
	[void] $NameOut.Add($WPFtxtMissionName.Text)
	[void] $NameOut.Add($WPFarrGameMode.SelectedItem.Name)
	[void] $NameOut.Add("v" + $WPFtxtMissionVersion.Text)
	[void] $NameOut.Add($WPFcmbPrefSegment.SelectedItem)
	$WPFtxtMissionNameOutput.Text = $NameOut -join '_'

	$WPFtxtMissionNameOutput1.Text = $WPFtxtMissionNameOutput.Text
	$WPFtxtMissionNameOutput2.Text = $WPFtxtMissionNameOutput.Text

	if ($WPFtxtMissionNameOutput.Text -cnotmatch '^FNF_[A-z0-9]+_[A-z0-9\-]+_[A-z0-9]+_v[0-9]{1,2}_(EU|NA|Any)') {
		$WPFtxtMissionNameOutput.Background = "#FFFFB3B3"
		$WPFtxtMissionNameOutput1.Background = "#FFFFB3B3"
		$WPFtxtMissionNameOutput2.Background = "#FFFFB3B3"
	} else {
		$WPFtxtMissionNameOutput.Background = "#FFFFFFFF"
		$WPFtxtMissionNameOutput1.Background = "#FFFFFFFF"
		$WPFtxtMissionNameOutput2.Background = "#FFFFFFFF"
	}


	
	$ObjCount = ($ObjCountCtrls | Where-Object { $_.isChecked }).Name[-1]

	# ATTACKERS
	$Attackers = $RoleCntrls | Where-Object { $_.SelectedItem -eq "Attacking" } | Select-Object -ExpandProperty Name
	if ($Attackers) {
		[Array] $AtkArr
		ForEach ($Atk in $Attackers) {
			$AtkArr += " $($Atk.Substring(3,3).ToUpper())"
		}
		[String] $AtkString = [String]::join('', $AtkArr)
	}

	# DEFENDERS
	$Defenders = $RoleCntrls | Where-Object { $_.SelectedItem -eq "Defending" } | Select-Object -ExpandProperty Name
	if ($Defenders) {
		[Array] $DefString
		ForEach ($Def in $Defenders) {
			$DefArr += " $($Def.Substring(3,3).ToUpper())"
		}
		[String] $DefString = [String]::join('', $DefArr)
	}


	# ASSETS
	[Array] $AssetsArr = @()

	if (" BLU" -in $AtkArr) {
		$AssetsArr += ("BLU: " + $WPFtxtBluAssets.Text + " // ")
	}
	if (" OPF" -in $AtkArr) {
		$AssetsArr += ("OPF: " + $WPFtxtOpfAssets.Text + " // ")
	}
	if (" IND" -in $AtkArr) {
		$AssetsArr += ("IND: " + $WPFtxtIndAssets.Text + " // ")
	}
	if (" BLU" -in $DefArr) {
		$AssetsArr += ("BLU: " + $WPFtxtBluAssets.Text + " // ")
	}
	if (" OPF" -in $DefArr) {
		$AssetsArr += ("OPF: " + $WPFtxtOpfAssets.Text + " // ")
	}
	if (" IND" -in $DefArr) {
		$AssetsArr += ("IND: " + $WPFtxtIndAssets.Text + " // ")
	}

	[String] $AssetsString = [String]::join('', $AssetsArr)



	if ($DefString) {
		[String] $DescOut = $WPFarrGameMode.SelectedItem.Name.ToUpper() + "(" + $ObjCount + ") // ATK:" + $AtkString + " " + $WPFsldAttackerAdvantage.Value + "% adv - DEF:" + $DefString + " // " + $AssetsString
	} else {
		[String] $DescOut = $WPFarrGameMode.SelectedItem.Name.ToUpper() + "(" + $ObjCount + ") // ATK:" + $AtkString + " " + $AssetsString
	}
	

	$WPFtxtMissionDescriptionOutput.Text = $DescOut

	$WPFtxtMissionDescriptionOutput1.Text = $WPFtxtMissionDescriptionOutput.Text
	$WPFtxtMissionDescriptionOutput2.Text = $WPFtxtMissionDescriptionOutput.Text

	# if ($WPFtxtMissionDescriptionOutput.Text -cnotmatch	'^[A-Z]+\(\d{1}\) \/\/ ATK: ([A-Z]{3} [\d]{1,2}% adv - DEF: [A-Z]{3}|[A-Z]{3} [A-Z]{3}|[A-Z]{3} [A-Z]{3} [A-Z]{3}) \/\/ ([A-Z]{3}: (.+) \/\/ [A-Z]{3}: (.+)|[A-Z]{3}: (.+) \/\/ [A-Z]{3}: (.+) \/\/ [A-Z]{3}: (.+))') {
	# 	$WPFtxtMissionDescriptionOutput.Background = "#FFFFB3B3"
	# 	$WPFtxtMissionDescriptionOutput1.Background = "#FFFFB3B3"
	# 	$WPFtxtMissionDescriptionOutput2.Background = "#FFFFB3B3"
	# } else {
	# 	$WPFtxtMissionDescriptionOutput.Background = "#FFFFFFFF"
	# 	$WPFtxtMissionDescriptionOutput1.Background = "#FFFFFFFF"
	# 	$WPFtxtMissionDescriptionOutput2.Background = "#FFFFFFFF"
	# }
}



# $ErrorActionPreference = "SilentlyContinue"

# METADATA
@(
	"NA",
	"EU",
	"Any"
) | ForEach-Object { [void]$WPFcmbPrefSegment.items.Add($PSItem) }
$WPFcmbPrefSegment.SelectedIndex = 2
$WPFcmbPrefSegment.Add_SelectionChanged( { Set-OutputData })



# GAMEPLAY
@(
	[PSCustomObject]@{
		"Name"        = "adSector";
		"DisplayName" = "Atk/Def Sector";
	},
	[PSCustomObject]@{
		"Name"        = "connection";
		"DisplayName" = "Connection (Neutral Term)";
	},
	[PSCustomObject]@{
		"Name"        = "ctf";
		"DisplayName" = "Capture the Flag";
	},
	[PSCustomObject]@{
		"Name"        = "destroy";
		"DisplayName" = "Destroy";
	},
	[PSCustomObject]@{
		"Name"        = "nSector";
		"DisplayName" = "Neutral Sector";
	},
	[PSCustomObject]@{
		"Name"        = "rush";
		"DisplayName" = "Rush (SEQ Terminals)";
	},
	[PSCustomObject]@{
		"Name"        = "uplink";
		"DisplayName" = "Uplink (NSEQ Terminals)";
	}
) | ForEach-Object { [void] $WPFarrGameMode.items.Add($PSItem) }
$WPFarrGameMode.DisplayMemberPath = "DisplayName"
$WPFarrGameMode.SelectedIndex = 0

$WPFarrGameMode.Add_SelectionChanged( {
		if ($WPFarrGameMode.SelectedValue.DisplayName -eq 'Capture the Flag') {
			$WPFradioObjCount1.IsEnabled = $True
			$WPFradioObjCount1.IsChecked = $True
			$WPFradioObjCount2.IsEnabled = $False
			$WPFradioObjCount3.IsEnabled = $False
		} else {
			$WPFradioObjCount1.IsEnabled = $False
			$WPFradioObjCount1.IsChecked = $False
			$WPFradioObjCount2.IsEnabled = $True
			$WPFradioObjCount2.IsChecked = $True
			$WPFradioObjCount3.IsEnabled = $True
		}
		Set-OutputData
	})

$ObjCountCtrls = @($WPFradioObjCount1, $WPFradioObjCount2, $WPFradioObjCount3)
$WPFradioObjCount1.Add_Checked( { Set-OutputData })
$WPFradioObjCount2.Add_Checked( { Set-OutputData })
$WPFradioObjCount3.Add_Checked( { Set-OutputData })



@(
	"Not Included",
	"Attacking",
	"Defending"
) | ForEach-Object {
	[void] $WPFcmbBluRole.items.Add($_)
	$WPFcmbBluRole.SelectedIndex = 0
	[void] $WPFcmbOpfRole.items.Add($_)
	$WPFcmbOpfRole.SelectedIndex = 0
	[void] $WPFcmbIndRole.items.Add($_)
	$WPFcmbIndRole.SelectedIndex = 0
}
$WPFtxtBluAssets.IsReadOnly = $True
$WPFtxtBluAssets.Background = "#FFE5E5E5"
$WPFtxtOpfAssets.IsReadOnly = $True
$WPFtxtOpfAssets.Background = "#FFE5E5E5"
$WPFtxtIndAssets.IsReadOnly = $True
$WPFtxtIndAssets.Background = "#FFE5E5E5"

$WPFcmbBluRole.Add_SelectionChanged( { 
		if ($WPFcmbBluRole.SelectedValue -match "Not Included") {
			$WPFtxtBluAssets.IsReadOnly = $True
			$WPFtxtBluAssets.Background = "#FFE5E5E5"
		} else {
			$WPFtxtBluAssets.IsReadOnly = $False
			$WPFtxtBluAssets.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})
$WPFcmbOpfRole.Add_SelectionChanged( { 
		if ($WPFcmbOpfRole.SelectedValue -match "Not Included") {
			$WPFtxtOpfAssets.IsReadOnly = $True
			$WPFtxtOpfAssets.Background = "#FFE5E5E5"
		} else {
			$WPFtxtOpfAssets.IsReadOnly = $False
			$WPFtxtOpfAssets.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})
$WPFcmbIndRole.Add_SelectionChanged( { 
		if ($WPFcmbIndRole.SelectedValue -match "Not Included") {
			$WPFtxtIndAssets.IsReadOnly = $True
			$WPFtxtIndAssets.Background = "#FFE5E5E5"
		} else {
			$WPFtxtIndAssets.IsReadOnly = $False
			$WPFtxtIndAssets.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})

$RoleCntrls = @($WPFcmbBluRole, $WPFcmbOpfRole, $WPFcmbIndRole)


$WPFlblAttackerAdvantage.Content = "Attacker Advantage: {0}%" -f $WPFsldAttackerAdvantage.Value
$WPFsldAttackerAdvantage.Add_ValueChanged( {
		$WPFlblAttackerAdvantage.Content = "Attacker Advantage: {0}%" -f $WPFsldAttackerAdvantage.Value
		Set-OutputData
	})





# ALLOW COPY TO CLIPBOARD
$WPFcopyMissionNameOutput.Add_Click( {
		$WPFtxtMissionNameOutput.Text | Clip
	})
$WPFcopyMissionNameOutput1.Add_Click( {
		$WPFtxtMissionNameOutput1.Text | Clip
	})
$WPFcopyMissionNameOutput2.Add_Click( {
		$WPFtxtMissionNameOutput2.Text | Clip
	})
$WPFcopyMissionDescriptionOutput.Add_Click( {
		$WPFtxtMissionDescriptionOutput.Text | Clip
	})
$WPFcopyMissionDescriptionOutput1.Add_Click( {
		$WPFtxtMissionDescriptionOutput1.Text | Clip
	})
$WPFcopyMissionDescriptionOutput2.Add_Click( {
		$WPFtxtMissionDescriptionOutput2.Text | Clip
	})


# VALIDATION
$WPFtxtAuthor.Add_TextChanged( {
		Set-OutputData
		if ($WPFtxtAuthor.Text -cnotmatch '^[A-z0-9]+$') {
			$WPFtxtAuthor.Background = "#FFFFB3B3"
		} else {
			$WPFtxtAuthor.Background = "#FFFFFFFF"
		}
	})
$WPFtxtMissionName.Add_TextChanged( {
		if ($WPFtxtMissionName.Text -cnotmatch '^[A-z0-9\-]+$') {
			$WPFtxtMissionName.Background = "#FFFFB3B3"
		} else {
			$WPFtxtMissionName.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})
$WPFtxtMissionVersion.Add_TextChanged( {
		if ($WPFtxtMissionVersion.Text -cnotmatch '^\d{1,2}$') {
			$WPFtxtMissionVersion.Background = "#FFFFB3B3"
		} else {
			$WPFtxtMissionVersion.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})

$WPFtxtBluAssets.Add_TextChanged( {
		if ($WPFtxtBluAssets.Text -match '\/') {
			$WPFtxtBluAssets.Background = "#FFFFB3B3"
		} else {
			$WPFtxtBluAssets.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})
$WPFtxtOpfAssets.Add_TextChanged( {
		if ($WPFtxtOpfAssets.Text -match '\/') {
			$WPFtxtOpfAssets.Background = "#FFFFB3B3"
		} else {
			$WPFtxtOpfAssets.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})
$WPFtxtIndAssets.Add_TextChanged( {
		if ($WPFtxtIndAssets.Text -match '\/') {
			$WPFtxtIndAssets.Background = "#FFFFB3B3"
		} else {
			$WPFtxtIndAssets.Background = "#FFFFFFFF"
		}
		Set-OutputData
	})

$uri = New-Object system.uri(Get-Item ".\Images\fnf_logo.png" | Select-Object -ExpandProperty FullName)
$imagesource = New-Object System.Windows.Media.Imaging.BitmapImage $uri 
$imagebrush = New-Object System.Windows.Media.ImageBrush  $imagesource
$WPFgridAbout.Background = $imagebrush
$WPFgridAbout.Background.Stretch = "None"


<# 
		Write-Host
		Show-ListMenu -Title "FNF Mission Name Formatter"
		$AuthorName = Read-Host "Author Name"


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
 #>



$FormMain.Add_Loaded( { Set-OutputData })
$FormMain.ShowDialog()
$FormMain.Close()

@"
$(Get-Date -Format "o")
Mission Name: $($WPFtxtMissionNameOutput.Text)
Mission Description: $($WPFtxtMissionDescriptionOutput.Text)

"@ >> "GeneratedMissionData.txt"





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
