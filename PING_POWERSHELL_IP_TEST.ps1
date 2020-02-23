# This is used to verify if all IP's in a specific file are reachable. paste each separate IP line by line.
Start-Transcript -Path .\log.txt
(Get-Content .\IPAddresses.txt) | ForEach {Write-Host $_, "-", ([System.Net.NetworkInformation.Ping]::new().Send($_)).Status}
Stop-Transcript

Pause
