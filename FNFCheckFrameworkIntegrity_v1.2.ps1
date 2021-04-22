<#

.SYNOPSIS

This script uses WinMerge's Console implementation to quickly review ways in which a specific mission's files differ from the latest version of the framework files.

.DESCRIPTION

3rd Party Tools Used: 
	- 7-zip <<https://www.7-zip.org/download.html>
	- WinMerge <https://winmerge.org/downloads/>

This script is intended to allow mission reviewers to quickly identify places where a submitted mission's files differ from the FNF Framework defaults. This can be used to ensure the integrity of the framework is intact, as well as compare the version used against the latest published on GitHub.

__WINMERGE OPTION CHANGE__

It's important to have WinMerge ignore carriage return differences to eliminate false positives.
Open WinMerge > Edit menu > Options > Compare > General > Tick "Ignore carriage return differences (Windows/Unix/Mac)"

__How to Use:__

	1. Install 7-zip and WinMerge.
	_Running the script will automatically offer you a download link if not already installed_

	2. Place this script into the unpacked mission folder.

	3. Left-click the script to select it, then Right-click it and select Run with Powershell.
	_If you don't see the Run with Powershell option, check your default file associations for .ps1 files)_

.NOTES

Script Process:
	1. Checks for an existing temp folder one-level up from the mission (if ran prior) and delete it if it exists.
	2. Downloads the latest version of the framework released to the master branch of the GitHub repository, in .zip format.
	3. Extracts downloaded .zip archive into the temp folder.
	4. Launches WinMerge for easy comparison of the framework files to the mission files.

Author: IndigoFox
Website: indifox.info
Email: indifox926@gmail.com
Discord: IndigoFox#6290

#>

$Version = ($PSCommandPath -split 'v')[-1] -replace '.ps1', ''
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Gray"
$Host.UI.RawUI.WindowTitle = "FNF Framework Integrity Check Utility v$Version"

$CurrentPath = (Get-Location).Path
$ParentPath = Split-Path -Parent (Get-Location).Path
$FrameworkTempFileName = "FNFFrameworkTemp.zip"
$FrameworkTempFolder = "FNF-Framework-Temp"



# DEFINE IMPORTANT VARIABLES HERE FOR YOUR MACHINE
Add-Type -AssemblyName System.Windows.Forms
# Import PresentationFramework for message boxes
Add-Type -AssemblyName PresentationFramework

# WinMerge
$WinMergePath = Get-ChildItem -Directory -Filter 'WinMerge' -Path $env:ProgramFiles | Select-Object -ExpandProperty FullName
if (!$WinMergePath) {
	$WinMergePath = Get-ChildItem -Directory -Filter 'WinMerge' -Path ${env:ProgramFiles(x86)} | Select-Object -ExpandProperty FullName
}
if (!$WinMergePath) {
	$null = [System.Windows.MessageBox]::Show('Unable to find WinMerge''s install path automatically.

Please find the installed WinMergeU.exe file
using the following dialog.', 'WinMerge', 'OK', 'Information')
	$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
		InitialDirectory = $env:SystemDrive;
		Filter           = 'WinmergeU.exe|WinMergeU.exe';
	}
	$null = $FileBrowser.ShowDialog()
	if ($FileBrowser.FileName) {
		$WinMergePath = Split-Path -Path $FileBrowser.FileName -Parent
		$FileBrowser = $null
	} else {
		if (([System.Windows.MessageBox]::Show(
					"You must install WinMerge in order to use this script.`n`nPress OK to open the download page in your default browser.",
					"Install Required",
					"OKCancel",
					"Information")) -eq "OK") {

			# If user clicks OK
			Start-Process "https://winmerge.org/downloads/"
			exit
		} else {
			# If user clicks Cancel
			exit
		}
	}
}

# 7-Zip
$7zPath = Get-ChildItem -Directory -Filter '7-Zip' -Path $env:ProgramFiles | Select-Object -ExpandProperty FullName
if (!$7zPath) {
	$7zPath = Get-ChildItem -Directory -Filter '7-Zip' -Path ${env:ProgramFiles(x86)} | Select-Object -ExpandProperty FullName
}
if (!$7zPath) {
	$null = [System.Windows.MessageBox]::Show('Unable to find 7-Zip''s install path automatically.
	
Please find the installed 7z.exe file
using the following dialog.','7-Zip', 'OK', 'Information')
	$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
		InitialDirectory = $env:SystemDrive;
		Filter           = '7z.exe|7z.exe';
	}
	$null = $FileBrowser.ShowDialog()
	if ($FileBrowser.FileName) {
		$7zPath = Split-Path -Path $FileBrowser.FileName -Parent
		$FileBrowser = $null
	} else {
		if (([System.Windows.MessageBox]::Show(
					"You must install 7-Zip in order to use this script.`n`nPress OK to open the download page in your default browser.",
					"Install Required",
					"OKCancel",
					"Information")) -eq "OK") {

			# If user clicks OK
			Start-Process "https://www.7-zip.org/download.html"
			exit
		} else {
			# If user clicks Cancel
			exit
		}
	}
}





# Confirm working directory is correct
if ([System.Windows.MessageBox]::Show(
		"Please confirm this directory is the mission folder, and contains the files you'd like to compare:`n`n$((Get-Location).Path)",
		"Confirm Path",
		"YesNo",
		"Warning") -eq "No") {
	
	# If user clicks No, instruct and exit
	[System.Windows.MessageBox]::Show(
		"You will need to move this .ps1 file to the mission directory containing the files to compare, then Right-click and Run with Powershell.`n`nIf you don't see the Run with Powershell option, check your default file associations.",
		"Action Needed",
		"OK",
		"Information"
	);

	exit
};


# Start working in the parent directory of the mission files
Set-Location $ParentPath

$GetReleaseFunc = {
	try {
		$JSON = (Invoke-WebRequest -Uri "https://api.github.com/repos/Mjolnir64/FNF/releases" -Method GET | Select-Object -ExpandProperty Content | ConvertFrom-Json)[0]
		$LatestRelease = $JSON[0]
		$AssetsList = $LatestRelease | Select-Object -ExpandProperty Assets
		if ($AssetsList[0]) {
			return $AssetsList[0] | Select-Object -ExpandProperty browser_download_url
		} else {
			return "No packages found included with this release!"
		}
	} catch {
		return "Please report the below error to Indigo#6290 on Discord.`n$($PSItem.Exception.Message)"
	}
}

$ReleaseCheck = Start-Job -ScriptBlock $GetReleaseFunc
Write-Host "Fetching latest release."
Start-Sleep 1
Write-Host "Fetching latest release.."
Start-Sleep 1
Write-Host "Fetching latest release..."
Start-Sleep 1
$ReleaseCheckStatus = $ReleaseCheck | Wait-Job | Receive-Job

if ($ReleaseCheckStatus -notmatch '^http') {
	Write-Warning "Unable to pull reference data.`n$ReleaseCheckStatus"
	pause
	exit
}

try {
	# Attempt download of the framework to a zip file one directory above.
	# Invoke-WebRequest -Method GET "https://github.com/Mjolnir64/FNF/archive/master.zip" -OutFile ".\$FrameworkTempFileName"
	Invoke-WebRequest -Method GET -Uri $ReleaseCheckStatus -OutFile ".\$FrameworkTempFileName"
} catch {

	# Download failed, show error and exit
	[System.Windows.MessageBox]::Show(
		"Failed to download a copy of the framework for comparison.`nEnsure github.com is accessible, then retry.",
		"Download Failed",
		"OK",
		"Stop")
	exit
}




# Remove existing temp directory to ensure latest can be downloaded
try {

	# First, try removing the normal way
	if (Test-Path ".\$FrameworkTempFolder") {
		Remove-Item -Path ".\$FrameworkTempFolder" -Recurse -Force -EA Stop
	}
} catch [System.ComponentModel.Win32Exception] {

	# Workaround if files are blocked for deletion due to OneDrive sync
	# Fetch all subfolders and sort by deepest in tree (most '\' in path)
	$SubFolders = Get-ChildItem -LiteralPath "$ParentPath\$FrameworkTempFolder" -Directory -Recurse | Select-Object FullName | Sort-Object { ($_.FullName -split '\\').count } -Descending

	foreach ($SubFolder in $SubFolders) {

		# Write-Host "Removing $($SubFolder.FullName)"

		# Get all files in the subdirectory
		$SubItems = Get-ChildItem -LiteralPath $SubFolder.FullName -File | Select-Object FullName
		ForEach ($SubItem in $SubItems) {
			# Delete these files
			(Get-Item $SubItem.FullName).Delete()
		}

		# Get the folder and delete it
		(Get-Item $SubFolder.FullName).Delete()
	}

	# Once all subitems are removed, get and delete the main temp folder
	$MainTempFolder = Get-Item -LiteralPath "$ParentPath\$FrameworkTempFolder"
	$MainTempFolder.Delete()
} catch {

	# If couldn't clear existing temp directory, notify and exit
	[System.Windows.MessageBox]::Show(
		"Failed to remove existing temp directory:`n$ParentPath\$FrameworkTempFolder`n`nPlease ensure this folder and files within`nare not currently in use.`n`nError Message: $($PSItem.Exception.Message)",
		"Temp Files",
		"OK",
		"Stop")
	exit
}


# Existing temp directory removed. Extract downloaded archive from GitHub to temp folder.
Start-Process -FilePath "$7zPath\7z.exe" -ArgumentList "x -o$FrameworkTempFolder -- "".\$FrameworkTempFileName""" -Wait


if (!(Test-Path $FrameworkTempFolder)) {

	# If files not extracted, notify and exit
	[System.Windows.MessageBox]::Show(
		"Unable to validate temp directory was created at:`n$ParentPath\$FrameworkTempFolder`n`n",
		"Files Could Not Be Extracted",
		"OK",
		"Exclamation")
	exit
}


Start-Process -FilePath "$WinMergePath\WinMergeU.exe" -ArgumentList "/r /fr /dl ""Latest Template"" /dr ""Current Mission"" ""$ParentPath\$FrameworkTempFolder\FNF_MissionTemplate.VR\"" ""$CurrentPath\"""





# SIG # Begin signature block
# MIIR5QYJKoZIhvcNAQcCoIIR1jCCEdICAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUyxgQTumSwWtlgJkSw3KgiSvb
# mfiggg1QMIIDFTCCAf2gAwIBAgIQarNwqALG/45HOA0xJfnsbTANBgkqhkiG9w0B
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
# DAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUCjU7fllWnNigSrkNJGsbZij4
# CTYwDQYJKoZIhvcNAQEBBQAEggEAlqbCoq0WsdDaA3tcgIKcxEVg58mpZeBp71W/
# cZ4CHHzFQNorzkzSb+Lh8EThxCBpXIMe37ZGXZROgHIiUFYjE2InMNze9nX1dykY
# uzRQQOUavQilDyft1RCvqQgkvjS/lGlXAYR/ZtizeJVua98oGbhWOeN7MAitgZHu
# k7VfZ0EbrgUn1ks3GOj8eMN73I6vyW44TT5uLlSNzmJV6rzCkEHBkACIU3qxbsGE
# HjwNZjoXFrY7rHFBHeZrkOXK7PFNHnJOzPwiPPsAk4WgKX5KSK+CQovt7nNd4r6F
# 1kwOWsGWZKYQdO62A3XTFpofn4h5LETDWerHcGcsTug6NbW8JqGCAjAwggIsBgkq
# hkiG9w0BCQYxggIdMIICGQIBATCBhjByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
# RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQD
# EyhEaWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQgVGltZXN0YW1waW5nIENBAhANQkrg
# vjqI/2BAIc4UAPDdMA0GCWCGSAFlAwQCAQUAoGkwGAYJKoZIhvcNAQkDMQsGCSqG
# SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwNDIyMTAzNDUwWjAvBgkqhkiG9w0B
# CQQxIgQg1abzEhFupOaadvZJsUW0P877SCtbWVFQiyHawPjB1gswDQYJKoZIhvcN
# AQEBBQAEggEAHcVenJng8PXhfB8VbbxFhwTcEiap85FXyTs7268ufCVMX2acqdCk
# 4Sb68Fy5ywAgcRV3vA2QtKep0IRVVsqI1Jsnfos7k7Ex6EsltuPMdKFVRQaMr1x3
# SuBR0tv88un5/TRpdDcNbl+iCDGPXAyqq16/jj3ynMSA57LbcGmhNrop8lNaQJhM
# Z0oCw6xrCGMNQtF8vGWGtxbf8pxXlU/x66gafLC2aDRkGI6xdGrpyC3W+8xyDPuE
# In+oHcqpbEUVhLujQtSG5Huggjpn/xC2LDsfdA/8UF4XXGU+Pm6gvncaimLnQoil
# nrtp842vOy8bEoiNSy+2CcDKt7MyQw67TA==
# SIG # End signature block
