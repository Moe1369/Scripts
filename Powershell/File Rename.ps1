$DTX = Get-Childitem -Path "E:\test" | Where-Object Name -like *.dtx | Out-Gridview -OutputMode Single -Title "DTX Datei auswählen"
$wshell = New-Object -ComObject Wscript.Shell

if ($DTX) {
	$Datum = $DTX
    $Datum = $Datum.Name -replace '\D+'
    $Datum = [datetime]::ParseExact($Datum, 'ddMMyyyy', $null)
    $Datum = $Datum.ToString("yyyy-MM-dd")
    
    $NachName = $DTX
    $NachName = $NachName.Name.Split("_")[0]
    
    $VorName = $DTX
    $VorName = $VorName.Name.Split("_")[1] 
    
    New-Item -ItemType "directory"  -Path "E:\test\$($Datum + ' ' + $NachName + ', ' +  $VorName )\0" -Force
    $Ordner = "E:\test\$($Datum + ' ' + $NachName + ', ' +  $VorName )" 
    $DTX | Move-Item -Destination $Ordner 
	$Output = $wshell.Popup("Datei von $($NachName), $($VorName) verschoben.",0,"DTX")
}
else {
	$Output = $wshell.Popup("Keine DTX Datei vorhanden.",0,"DTX")
}