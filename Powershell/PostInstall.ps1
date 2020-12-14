Reif(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
	exit;
}


if ($(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty PCSystemType) -ne 2) {
	Write-Host "Dieses Gerät muss nicht verschlüsselt werden"
}
else {
	Get-Bitlockervolume C: | Enable-Bitlocker -EncryptionMethod Aes256 -UsedSpaceOnly -RecoveryKeyPath "F:\Keys" -RecoveryKeyProtector
}

# Silent Install (.msi)
msiexec.exe /i F:\Software\iisexpress_amd64_de-DE.msi /qn
msiexec.exe /i F:\Software\GoogleChromeStandaloneEnterprise64.msi /qn
msiexec.exe /i F:\Software\putty-0.71-installer.msi /qn
msiexec.exe /i F:\Software\pdf24-creator-8.8.2.msi /qn
msiexec.exe /i F:\Software\7z1900-x64.msi /qn

# Silent Install (.exe)
F:\Software\Greenshot-INSTALLER-1.2.10.6-RELEASE.exe /VERYSILENT
F:\Software\NDP47-KB3186497-x86-x64-AllOS-ENU.exe /q /norestart
F:\Software\npp.7.6.6.Installer.exe /S 
F:\Software\vlc-2.2.2-win64.exe /L 1031 /S

# Office Installation
F:\OfficeTools\setup.exe /configure configuration.xml


# Unnötige Microsoft Apps deinstallieren
AGet-AppxPackage "Microsoft.3DBuilder" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.AppConnector" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingFinance" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingFoodAndDrink" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingHealthAndFitness" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingMaps" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingNews" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingSports" | Remove-AppxPackage  -AllUsers
Get-AppxPackage "Microsoft.BingTranslator" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingTravel" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.BingWeather" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.CommsPhone" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.ConnectivityStore" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.FreshPaint" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.GetHelp" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Getstarted" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.HelpAndTips" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Media.PlayReadyClient.2" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Messaging" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Microsoft3DViewer" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MicrosoftPowerBIForWindows" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MinecraftUWP" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MoCamera" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.MSPaint" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.NetworkSpeedTest" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.OfficeLens" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Office.OneNote" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Office.Sway" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.OneConnect" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.People" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Print3D" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Reader" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.RemoteDesktop" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.SkypeApp" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Todos" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Wallet" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WebMediaExtensions" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Whiteboard" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsAlarms" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsCamera" | Remove-AppxPackage -AllUsers
Get-AppxPackage "microsoft.windowscommunicationsapps" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsFeedbackHub" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsMaps" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsPhone" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsReadingList" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsScan" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WindowsSoundRecorder" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WinJS.1.0" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.WinJS.2.0" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.YourPhone" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.ZuneMusic" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.ZuneVideo" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Microsoft.Advertising.Xaml" | Remove-AppxPackage -AllUsers
    
# Unnötige Third-Party Sachen deinstallieren
Get-AppxPackage "2414FC7A.Viber" | Remove-AppxPackage -AllUsers
Get-AppxPackage "41038Axilesoft.ACGMediaPlayer" | Remove-AppxPackage -AllUsers
Get-AppxPackage "46928bounde.EclipseManager" | Remove-AppxPackage -AllUsers
Get-AppxPackage "4DF9E0F8.Netflix" | Remove-AppxPackage -AllUsers
Get-AppxPackage "64885BlueEdge.OneCalendar" | Remove-AppxPackage -AllUsers
Get-AppxPackage "7EE7776C.LinkedInforWindows" | Remove-AppxPackage -AllUsers
Get-AppxPackage "828B5831.HiddenCityMysteryofShadows" | Remove-AppxPackage -AllUsers -AllUsers
Get-AppxPackage "89006A2E.AutodeskSketchBook" | Remove-AppxPackage -AllUsers
Get-AppxPackage "9E2F88E3.Twitter" | Remove-AppxPackage -AllUsers
Get-AppxPackage "A278AB0D.DisneyMagicKingdoms" | Remove-AppxPackage -AllUsers
Get-AppxPackage "A278AB0D.DragonManiaLegends" | Remove-AppxPackage -AllUsers
Get-AppxPackage "A278AB0D.MarchofEmpires" | Remove-AppxPackage -AllUsers
Get-AppxPackage "ActiproSoftwareLLC.562882FEEB491" | Remove-AppxPackage -AllUsers
Get-AppxPackage "AD2F1837.GettingStartedwithWindows8" | Remove-AppxPackage -AllUsers
Get-AppxPackage "AD2F1837.HPJumpStart" | Remove-AppxPackage -AllUsers
Get-AppxPackage "AD2F1837.HPRegistration" | Remove-AppxPackage -AllUsers
Get-AppxPackage "AdobeSystemsIncorporated.AdobePhotoshopExpress" | Remove-AppxPackage  -AllUsers
Get-AppxPackage "Amazon.com.Amazon" | Remove-AppxPackage -AllUsers
Get-AppxPackage "C27EB4BA.DropboxOEM" | Remove-AppxPackage -AllUsers
Get-AppxPackage "CAF9E577.Plex" | Remove-AppxPackage -AllUsers
Get-AppxPackage "CyberLinkCorp.hs.PowerMediaPlayer14forHPConsumerPC" | Remove-AppxPackage  -AllUsers
Get-AppxPackage "D52A8D61.FarmVille2CountryEscape" | Remove-AppxPackage  -AllUsers
Get-AppxPackage "D5EA27B7.Duolingo-LearnLanguagesforFree" | Remove-AppxPackage -AllUsers
Get-AppxPackage "DB6EA5DB.CyberLinkMediaSuiteEssentials" | Remove-AppxPackage -AllUsers
Get-AppxPackage "DolbyLaboratories.DolbyAccess" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Drawboard.DrawboardPDF" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Facebook.Facebook" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Fitbit.FitbitCoach" | Remove-AppxPackage -AllUsers
Get-AppxPackage "flaregamesGmbH.RoyalRevolt2" | Remove-AppxPackage -AllUsers
Get-AppxPackage "GAMELOFTSA.Asphalt8Airborne" | Remove-AppxPackage -AllUsers
Get-AppxPackage "KeeperSecurityInc.Keeper" | Remove-AppxPackage -AllUsers
Get-AppxPackage "king.com.BubbleWitch3Saga" | Remove-AppxPackage -AllUsers
Get-AppxPackage "king.com.CandyCrushFriends" | Remove-AppxPackage -AllUsers
Get-AppxPackage "king.com.CandyCrushSaga" | Remove-AppxPackage -AllUsers
Get-AppxPackage "king.com.CandyCrushSodaSaga" | Remove-AppxPackage -AllUsers
Get-AppxPackage "king.com.FarmHeroesSaga" | Remove-AppxPackage -AllUsers
Get-AppxPackage "Nordcurrent.CookingFever" | Remove-AppxPackage -AllUsers
Get-AppxPackage "PandoraMediaInc.29680B314EFC2" | Remove-AppxPackage -AllUsers
Get-AppxPackage "PricelinePartnerNetwork.Booking.comBigsavingsonhot" | Remove-AppxPackage -AllUsers
Get-AppxPackage "SpotifyAB.SpotifyMusic" | Remove-AppxPackage -AllUsers
Get-AppxPackage "ThumbmunkeysLtd.PhototasticCollage" | Remove-AppxPackage -AllUsers
Get-AppxPackage "WinZipComputing.WinZipUniversal" | Remove-AppxPackage -AllUsers
Get-AppxPackage "XINGAG.XING" | Remove-AppxPackage -AllUsers


Add-Computer -DomainName $(Read-Host "Wie lautet die FQDN der Domäne?")