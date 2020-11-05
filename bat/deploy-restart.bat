@ECHO OFF
PowerShell.exe -Command "& 'c:/code/deploy/stop.ps1'"
PowerShell.exe -Command "& 'c:/code/deploy/git-update.ps1'"
PowerShell.exe -Command "& 'c:/code/deploy/start.ps1'"
PAUSE
