. $PSScriptRoot\config.ps1

"Starting PSSession ($sname) and disconnecting.."
New-PSSession -ComputerName . -Name $sname | Disconnect-PSSession
