Import-Module ActiveDirectory
$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$WindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($CurrentUser)
if ($WindowsPrincipal.IsInRole("Administrators")) {
    Get-ADComputer -Filter * -SearchBase "OU=Server,OU=VirtualServers, DC=contoso, DC=com" | Sort-Object Name | ForEach-Object {
        Get-Childitem -Directory \\$($_.Name)\D$\temp\cache1, \\$($_.Name)\D$\temp\cache2, \\$($_.Name)\D$\temp\cache3, \\$($_.Name)\D$\temp\cache4 -ErrorAction SilentlyContinue
    } | Group-Object -Property Parent, Name  | Select-Object Count, Name, Group | Sort-Object Name | Out-GridView -PassThru -Title "Wähle eine Cachegruppe zum löschen" | Foreach-Object { $_.Group | Remove-Item -Recurse -Force -Verbose | Add-Content C:\log.txt } 
}
else {
    Write-Host "Script bitte als Domänen Administrator ausführen"
}


