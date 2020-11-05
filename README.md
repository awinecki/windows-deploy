# Windows Server auto-deployment scripts (Powershell) for CI/CD

There's a simple python service which is run with `python c:/code/test/app.py` (configurable in `config.ps1`). It logs current datetime to both `stdout` and file: `c:/code/test/log.txt` (defined in `app.py`).

Upon each new commit, I'd like to stop the service process, then update the repository to latest SHA (e.g. `git reset --hard origin/master`), and restart the process.

Doing most of the above via SSH is already solved. Then, 2 scripts `start.ps1` and `stop.ps1` are capable of starting and stopping the process in the background, using an approach based on Powershell `PSSession` and `Invoke-Command -Session $s -Asjob`.

- https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/invoke-command?view=powershell-7
- https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/New-PSSession?view=powershell-7

But 2 problems remain:

## Streaming `stdout/stderr` logs to a file

I need the service's logs to be streamed to log files for debugging purposes and then sending to a 3rd party centralized log store, like LogDNA, Datadog, etc.

## Process dies after approx. 10 minutes of working in the background

The `app.py` service works, even after logging out, still appends new lines to the `log.txt` file. But after around 10 minutes it stops. The file stops growing in size, and I can't access the job's logs so I don't know why it stopped.

Before arriving at the PSSession/Invoke-Command approach, I've also checked:

- Doing just [`Start-Process`](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Management/Start-Process?view=powershell-7) without using `PSSessions` (the process died as soon as I logged out of SSH)
- [Windows Services](https://docs.microsoft.com/en-us/archive/msdn-magazine/2016/may/windows-powershell-writing-windows-services-in-powershell): very complex, couldn't write a working service definition

