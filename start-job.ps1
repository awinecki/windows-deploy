. $PSScriptRoot\config.ps1

"Getting PSSession ($sname) and connecting to it.."
$session = Get-PSSession -ComputerName . -Name $sname
$session | Connect-PSSession

"Invoking command ($command) in $sname session as job $jobname.."
$job = Invoke-Command -Session $session -ScriptBlock $command -AsJob -JobName $jobname

"Disconnecting from the session ($sname).."
$session | Disconnect-PSSession

