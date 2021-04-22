#Your XAML goes here :)
$inputXML = @"
<Window x:Name="FormatterWindow" x:Class="WpfApp1.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:WpfApp1"
        mc:Ignorable="d"
        Title="Friday Night Fight - Mission Text Formatter" Height="605.154" Width="1228.941" Topmost="True" WindowStartupLocation="CenterScreen" ResizeMode="CanMinimize" SnapsToDevicePixels="True" UseLayoutRounding="False">
    <Grid>
        <TabControl TabStripPlacement="Left">
            <TabItem Header="Metadata">
                <Grid Background="#FFE5E5E5">
                    <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="538" Margin="10,10,0,0" VerticalAlignment="Top" Width="294"/>
                    <Label Content="Author" HorizontalAlignment="Left" Margin="29,95,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="txtAuthor" HorizontalAlignment="Left" Height="23" Margin="120,99,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="159" MaxLength="16"/>
                    <Label Content="Mission Name" HorizontalAlignment="Left" Margin="29,123,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="txtMissionName" HorizontalAlignment="Left" Height="23" Margin="120,127,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="159" MaxLength="16"/>
                    <Label Content="Version" HorizontalAlignment="Left" Margin="29,151,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="txtMissionVersion" HorizontalAlignment="Left" Height="23" Margin="120,155,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="159" MaxLength="2"/>
                    <ComboBox x:Name="cmbPrefSegment" HorizontalAlignment="Left" Margin="120,183,0,0" VerticalAlignment="Top" Width="159"/>
                    <Label Content="Pref. Segment" HorizontalAlignment="Left" Margin="29,182,0,0" VerticalAlignment="Top"/>
                    <Grid x:Name="gridOutput" Background="#FFE5E5E5" Margin="309,0,0,0">
                        <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="538" Margin="10,10,0,0" VerticalAlignment="Top" Width="819"/>
                        <Label Content="Mission Name" Margin="376,123,328,413"/>
                        <Label Content="Mission Description" Margin="366,302,308,235"/>
                        <TextBox x:Name="txtMissionNameOutput" HorizontalAlignment="Left" Height="23" Margin="53,160,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="745" IsReadOnly="True" TextAlignment="Center"/>
                        <TextBox x:Name="txtMissionDescriptionOutput" HorizontalAlignment="Left" Height="36" Margin="53,338,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="745" IsReadOnly="True" TextAlignment="Center"/>
                        <Button x:Name="copyMissionDescriptionOutput" Content="Copy to Clipboard" HorizontalAlignment="Left" Margin="366,395,0,0" VerticalAlignment="Top" Width="114"/>
                        <Button x:Name="copyMissionNameOutput" Content="Copy to Clipboard" HorizontalAlignment="Left" Margin="366,203,0,0" VerticalAlignment="Top" Width="114"/>
                    </Grid>
                    <Label Content="Mission Info" HorizontalAlignment="Left" Margin="88,29,0,0" VerticalAlignment="Top" FontSize="22" FontWeight="Bold"/>
                </Grid>
            </TabItem>
            <TabItem Header="Gameplay">
                <Grid Background="#FFE5E5E5">
                    <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="538" Margin="10,10,0,0" VerticalAlignment="Top" Width="294"/>

                    <ComboBox x:Name="arrGameMode" HorizontalAlignment="Left" Margin="124,104,0,0" VerticalAlignment="Top" Width="174"/>
                    <Label Content="Game Mode" HorizontalAlignment="Left" Margin="13,100,0,0" VerticalAlignment="Top"/>
                    <RadioButton x:Name="radioObjCount1" Content="1" HorizontalAlignment="Left" Margin="124,137,0,0" VerticalAlignment="Top" IsEnabled="False" GroupName="radioObjCount"/>
                    <RadioButton x:Name="radioObjCount2" Content="2" HorizontalAlignment="Left" Margin="184,137,0,0" VerticalAlignment="Top" IsChecked="True" GroupName="radioObjCount"/>
                    <RadioButton x:Name="radioObjCount3" Content="3" HorizontalAlignment="Left" Margin="244,137,0,0" VerticalAlignment="Top" GroupName="radioObjCount"/>
                    <Label Content="Objective Count" HorizontalAlignment="Left" Margin="13,131,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="cmbBluRole" HorizontalAlignment="Left" Margin="109,214,0,0" VerticalAlignment="Top" Width="174"/>
                    <Label Content="BLUFOR" HorizontalAlignment="Left" Margin="45,210,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="cmbOpfRole" HorizontalAlignment="Left" Margin="109,245,0,0" VerticalAlignment="Top" Width="174"/>
                    <Label Content="OPFOR" HorizontalAlignment="Left" Margin="50,241,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="cmbIndRole" HorizontalAlignment="Left" Margin="109,276,0,0" VerticalAlignment="Top" Width="174"/>
                    <Label Content="INDFOR" HorizontalAlignment="Left" Margin="45,272,0,0" VerticalAlignment="Top"/>
                    <Label Content="Side Roles" HorizontalAlignment="Left" Margin="124,183,0,0" VerticalAlignment="Top" FontWeight="Bold"/>
                    <Grid x:Name="gridOutput1" Background="#FFE5E5E5" Margin="309,0,0,0">
                        <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="538" Margin="10,10,0,0" VerticalAlignment="Top" Width="819"/>
                        <Label Content="Mission Name" Margin="376,123,328,413"/>
                        <Label Content="Mission Description" Margin="366,302,308,235"/>
                        <TextBox x:Name="txtMissionNameOutput1" HorizontalAlignment="Left" Height="23" Margin="53,160,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="745" IsReadOnly="True" TextAlignment="Center" Text=""/>
                        <TextBox x:Name="txtMissionDescriptionOutput1" HorizontalAlignment="Left" Height="36" Margin="53,338,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="745" IsReadOnly="True" TextAlignment="Center"/>
                        <Button x:Name="copyMissionDescriptionOutput1" Content="Copy to Clipboard" HorizontalAlignment="Left" Margin="366,395,0,0" VerticalAlignment="Top" Width="114"/>
                        <Button x:Name="copyMissionNameOutput1" Content="Copy to Clipboard" HorizontalAlignment="Left" Margin="366,203,0,0" VerticalAlignment="Top" Width="114"/>
                    </Grid>
                    <Slider x:Name="sldAttackerAdvantage" HorizontalAlignment="Left" Margin="67,358,0,0" VerticalAlignment="Top" Width="193" Maximum="25" TickPlacement="Both" Value="15" SmallChange="1" LargeChange="5" Interval="1" IsSnapToTickEnabled="True" SelectionEnd="25"/>
                    <Label x:Name="lblAttackerAdvantage" Content="Attacker Advantage: %" HorizontalAlignment="Left" Margin="96,327,0,0" VerticalAlignment="Top"/>
                    <Label Content="Gameplay Info" HorizontalAlignment="Left" Margin="74,38,0,0" VerticalAlignment="Top" FontSize="22" FontWeight="Bold"/>
                </Grid>
            </TabItem>
            <TabItem Header="Assets">
                <Grid Background="#FFE5E5E5">
                    <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Margin="10,10,0,20" Width="294"/>
                    
                    <Label Content="BLUFOR" HorizontalAlignment="Left" Margin="132,220,0,0" VerticalAlignment="Top"/>
                    <Label Content="OPFOR" HorizontalAlignment="Left" Margin="133,328,0,0" VerticalAlignment="Top"/>
                    <Label Content="INDFOR" HorizontalAlignment="Left" Margin="133,436,0,0" VerticalAlignment="Top"/>
                    <Label Content="Assets" HorizontalAlignment="Left" Margin="119,24,0,0" VerticalAlignment="Top" FontSize="22" FontWeight="Bold"/>
                    <Grid x:Name="gridOutput2" Background="#FFE5E5E5" Margin="309,0,0,0">
                        <Border BorderBrush="Black" BorderThickness="1" HorizontalAlignment="Left" Height="538" Margin="10,10,0,0" VerticalAlignment="Top" Width="819"/>
                        <Label Content="Mission Name" Margin="375,123,329,413"/>
                        <Label Content="Mission Description" Margin="366,302,308,235"/>
                        <TextBox x:Name="txtMissionNameOutput2" HorizontalAlignment="Left" Height="23" Margin="53,160,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="745" IsReadOnly="True" TextAlignment="Center" Text="{Binding Text, ElementName=txtMissionNameOutput, Mode=OneWay}"/>
                        <TextBox x:Name="txtMissionDescriptionOutput2" HorizontalAlignment="Left" Height="36" Margin="53,338,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="745" IsReadOnly="True" TextAlignment="Center"/>
                        <Button x:Name="copyMissionDescriptionOutput2" Content="Copy to Clipboard" HorizontalAlignment="Left" Margin="366,395,0,0" VerticalAlignment="Top" Width="114"/>
                        <Button x:Name="copyMissionNameOutput2" Content="Copy to Clipboard" HorizontalAlignment="Left" Margin="366,203,0,0" VerticalAlignment="Top" Width="114"/>
                    </Grid>
                    <TextBox x:Name="txtBluAssets" HorizontalAlignment="Left" Height="72" TextWrapping="Wrap" VerticalAlignment="Top" Width="274" Margin="21,251,0,0"/>
                    <TextBox x:Name="txtOpfAssets" HorizontalAlignment="Left" Height="72" TextWrapping="Wrap" VerticalAlignment="Top" Width="274" Margin="21,359,0,0"/>
                    <TextBox x:Name="txtIndAssets" HorizontalAlignment="Left" Height="72" TextWrapping="Wrap" VerticalAlignment="Top" Width="274" Margin="21,467,0,0"/>
                    <Label Content="Note: Controls disabled for factions marked &quot;Not Included&quot;" HorizontalAlignment="Left" Margin="27,63,0,0" VerticalAlignment="Top" FontStyle="Italic" FontSize="10" Height="27" Width="268"/>
                    <TextBlock HorizontalAlignment="Left" Margin="128,112,0,0" TextWrapping="Wrap" Text="Examples:" VerticalAlignment="Top"/>
                    <TextBlock HorizontalAlignment="Left" Margin="42,135,0,0" TextWrapping="Wrap" Text="5x M1151(1xM240, 2xLRAS/M2) 2x Quads, transport" VerticalAlignment="Top" FontSize="10"/>
                    <TextBlock HorizontalAlignment="Left" Margin="78,153,0,0" TextWrapping="Wrap" Text="4x GAZ(2xPKP), 2x Quads, Transport" VerticalAlignment="Top" FontSize="10"/>
                </Grid>
            </TabItem>
            <TabItem Header="About">
                <Grid x:Name="gridAbout">
                    <Grid.Background>
                        <ImageBrush Stretch="None"/>
                    </Grid.Background>
                    <Grid Margin="248,61,248,448" Background="#FFD19471">
                        <Grid.Effect>
                            <DropShadowEffect/>
                        </Grid.Effect>
                        <TextBlock TextWrapping="Wrap" Text="This tool was developed by Indigo#6290 for the Friday Night Fight Mission Development Team." TextAlignment="Center" VerticalAlignment="Center" HorizontalAlignment="Center" FontWeight="Bold"/>
                    </Grid>
                </Grid>
            </TabItem>
            

        </TabControl>

    </Grid>
</Window>


"@

$inputXML = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
try {
	$FormMain = [Windows.Markup.XamlReader]::Load( $reader )
} catch {
	Write-Warning "Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged or TextChanged properties in your textboxes (PowerShell cannot process them)"
	throw
}

#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================

$xaml.SelectNodes("//*[@Name]") | ForEach-Object { # "trying item $($_.Name)";
	try { Set-Variable -Name "WPF$($_.Name)" -Value $FormMain.FindName($_.Name) -ErrorAction Stop }
	catch { throw }
}

Function Get-FormMainVariables {
	if ($global:ReadmeDisplay -ne $true) { Write-Host "If you need to reference this display again, run Get-FormMainVariables" -ForegroundColor Yellow; $global:ReadmeDisplay = $true }
	Write-Host "Found the following interactable elements from our FormMain" -ForegroundColor Cyan
	Get-Variable WPF*
}

# Get-FormMainVariables

#===========================================================================
# Use this space to add code to the various FormMain elements in your GUI
#===========================================================================


#Reference

#Adding items to a dropdown/combo box
#$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})

#Setting the text of a text box to the current PC name
#$WPFtextBox.Text = $env:COMPUTERNAME

#Adding code to a button, so that when clicked, it pings a system
# $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
# })
#===========================================================================
# Shows the FormMain
#===========================================================================
# Write-Host "To show the FormMain, run the following" -ForegroundColor Cyan
# '$FormMain.ShowDialog() | out-null'



# SIG # Begin signature block
# MIIR5QYJKoZIhvcNAQcCoIIR1jCCEdICAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUcwYzoFrFshX8dc4visBBKdas
# XMWggg1QMIIDFTCCAf2gAwIBAgIQarNwqALG/45HOA0xJfnsbTANBgkqhkiG9w0B
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
# DAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUyuH13o2ZmBDBpmsDC7WudxmK
# ylgwDQYJKoZIhvcNAQEBBQAEggEALALhKPFQY9i5yShwYA5TH4cCg0pd2S989uSP
# JfnzgNoYPOcIoQJSdUPBVvRDn3e5+8xp2uq/iQoH5R3SLyWMlm4it2xmR7gAW2W9
# SbiRd6mD81xvaEhiVswlxx/1UPPKGcIXbAQWt5/vIG1Rc0CtyaVRxz4XK08ka3Ao
# L7+kKaOxZZulEdhbNkfI77hd6cG9tq5/C6VeX36dB6wCJxPiSA1qOZcDG/ifhcAy
# T9YyEyTX7MJVnGCrTGkCuo9esLINIQutPmUE/961LJY0BpdgIkGaszPOkHmiVLcL
# dwcR2jeqsq+9C/haTB+kwNz2JJp1O8NMmBj/jbaivQYjR5KMZ6GCAjAwggIsBgkq
# hkiG9w0BCQYxggIdMIICGQIBATCBhjByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
# RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQD
# EyhEaWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQgVGltZXN0YW1waW5nIENBAhANQkrg
# vjqI/2BAIc4UAPDdMA0GCWCGSAFlAwQCAQUAoGkwGAYJKoZIhvcNAQkDMQsGCSqG
# SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwNDIyMTAzNDUwWjAvBgkqhkiG9w0B
# CQQxIgQg96r6YUjfnjsFJqAFer1sWbGrrO7Jc017RDQcImZMMBQwDQYJKoZIhvcN
# AQEBBQAEggEAGvH42z7uxxriDLk5icQtJPisSiszROjlyeSETBTKKeSK4+IdrEyE
# kXujkJt9wZ3/SIZ0Triy+Euy29/9XlJ1DA6w4xbhGTXRMtwHGIJggtcArac3Tb/3
# VYMuUWts/mcEcgzc+rtgESD8/73rqsEcJvIr/h9oUYgbapxEb/BnFId7xe4CSWBP
# Ugq/h1ikn/cLu89SsNolYr0kmAA/CYzlgWR1sgYmfWVzhiyDKidkahd8AqOS0PMX
# MWPgkH6NlXMGG6Dqt6V7P9p7Z9/r7wSkqpzVoFbRYIG0nQP59oS++43lyj7i9DME
# T1PsCCqGKcVCpAW1sd+dhUGzGIUrOHljLw==
# SIG # End signature block
