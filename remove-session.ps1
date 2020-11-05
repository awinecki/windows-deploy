. $PSScriptRoot\config.ps1

"Getting PSSession $sname, disconnecting, then removing it.."

Get-PSSession -ComputerName . -Name $sname | Disconnect-PSSession | Remove-PSSession

