. $PSScriptRoot\config.ps1

"Stopping job $jobname.."

"Checking for lockfile.."
while (Test-Path $adobe_lock_path -PathType leaf) {
        "Adobe macro in progress (found lockfile: $adobe_lock_path). Retrying after $sleep_between_lock_check seconds.."
        Start-Sleep $sleep_between_lock_check
}

. $PSScriptRoot\remove-session.ps1
