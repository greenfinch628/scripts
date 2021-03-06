

function getRrcDate {
    return $(get-date -uformat "%Y%m%d_%H%M%S").toString()
}

function getRrcTime {
    return $(get-date -uformat "%Y%m%d_%H%M%S").toString()
}

(new-object -com SAPI.SpVoice).speak("Initiated mirror all users")


$tardir = "D:"
$rc = (New-Object System.IO.DriveInfo($tardir)).DriveType -ne 'NoRootDirectory'
if ( $rc -eq $false) {
    (new-object -com SAPI.SpVoice).speak("Turn on unlabled Fantom Drive and make sure it is the E drive.")
    (new-object -com SAPI.SpVoice).speak("Waiting for user responce.")
    write-host "Turn on unlabled Fantom Drive and make sure it is the F drive."
    $rc = read-host "Y to run mirror, N to cancel"
    $rc = $rc.tolower()
    if ($rc -ne "y") { exit }
}

# As of 01/05/2016
# powercfg -l
# or
#PS C:\Users\Bob\Documents\Scripts\BackupTool> powercfg -list
#
#Existing Power Schemes (* Active)
#-----------------------------------
#Power Scheme GUID: 36f2e176-e97f-41e3-a8bd-b2c60207702b  (Samsung High Performance) *
#Power Scheme GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced)
#Power Scheme GUID: 492c7b0e-100e-4f31-9671-71ca4d734ee0  (For Updates and backups)
#Power Scheme GUID: 6b854c12-f904-4f86-b4dc-5dbe07cf2b76  (Weekends)
#Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
#Power Scheme GUID: a17eef98-f6e5-43b2-bb6d-b4ad95ec7dc0  (Always On)
#Power Scheme GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (Power saver)
#Power Scheme GUID: c8151bd5-9664-41e2-9b53-06c6e676e094  (Weekdays)

Clear-Host

Set-Location C:\Users\Bob\Documents\Scripts\BackupTool
 
$rrcDate = getRrcDate 
#$rrcTime = getRrcTime

$scriptName = $myinvocation.mycommand.name
#$scriptName = $MyInvocation.InvocationName
$host.ui.rawui.set_WindowTitle($scriptName)

write-host "((((    (((   ((  (   RoboCopy - All   )  ))   )))    ))))"

(new-object -com SAPI.SpVoice).speak("Setting power plan to Backups and Syncs 4 hours")
write-host "Setting power plan to Backups and Syncs $(getRrcTime) on $rrcDate"
write-host " "
#powercfg.exe -SETACTIVE 492c7b0e-100e-4f31-9671-71ca4d734ee0 # (For Updates and backups - Never Sleep)
#powercfg.exe -GETACTIVESCHEME
write-host " "

(new-object -com SAPI.SpVoice).speak("Begin mirror")
write-host "Started Documents at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\bob\Documents" "$tardir\Users\rczys\Documents" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG:MIR_ALL_$rrcDate.log
write-host "Finished Documents at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup bob pictures")
write-host "Started Pictures at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\bob\Pictures" "$tardir\Users\rczys\Pictures" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Pictures at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup bob music")
write-host "Started Music at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\bob\Music" "$tardir\Users\rczys\Music" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Music at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup bob downloads")
write-host "Started Downloads at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\bob\Downloads" "$tardir\Users\rczys\Downloads" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Downloads at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup bob videos")
write-host "Started Videos at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\bob\Videos" "$tardir\Users\rczys\Videos" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Videos at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup liz documents")
write-host "Started Documents at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\ebczy_000\Documents" "$tardir\Users\eczys\Documents" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG:MIR_ALL_$rrcDate.log
write-host "FInished Documents at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup liz pictures")
write-host "Started Pictures at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\ebczy_000\Pictures" "$tardir\Users\eczys\Pictures" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Pictures at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup liz music")
write-host "Started Music at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\ebczy_000\Music" "$tardir\Users\eczys\Music" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Music at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup liz downloads")
write-host "Started Downloads at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\ebczy_000\Downloads" "$tardir\Users\eczys\Downloads" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Downloads at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup liz videos")
write-host "Started Videos at $(getRrcTime) on $rrcDate"
Robocopy "C:\Users\ebczy_000\Videos" "$tardir\Users\eczys\Videos" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Videos at $(getRrcTime) on $rrcDate"
write-host " "

#(new-object -com SAPI.SpVoice).speak("Backup public files")
write-host "Started Public Docs at $(getRrcTime) on $rrcDate"
Robocopy  "C:\Users\Public" "$tardir\Users\Public" /MIR /XA:SH /XD AppData /XJD /R:2 /W:2 /V /NP /TEE /LOG+:MIR_ALL_$rrcDate.log
write-host "Finished Public Docs at $(getRrcTime) on $rrcDate"
write-host " "

write-host "Setting power plan to Weekends $(getRrcTime) on $rrcDate"
write-host " "
#powercfg.exe -SETACTIVE c8151bd5-9664-41e2-9b53-06c6e676e094 # (Weekends - Sleep in 30 minutes)
powercfg.exe -GETACTIVESCHEME
powercfg.exe -l
write-host " "

write-host "((((    (((   ((  ( RoboCpy All Complete )  ))   )))    ))))"
(new-object -com SAPI.SpVoice).speak(" Backup and Sync completed.")
exit