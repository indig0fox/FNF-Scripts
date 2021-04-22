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


