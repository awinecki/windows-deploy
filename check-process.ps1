. $PSScriptRoot\config.ps1

"Checking if PSSession ($sname) is running.."

$session = Get-PSSession -ComputerName . -Name $sname

if ($session) {
        "Found the session. Printing:"
        $session
} else {
        "No session found!"
}
