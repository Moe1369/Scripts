Import-Csv C:\test.csv | 
Foreach-Object  {Set-AdUser -Identity $_.samaccountName -Replace @{telephoneNumber=$_.telephoneNumber;ipPhone=$_.ipPhone}}