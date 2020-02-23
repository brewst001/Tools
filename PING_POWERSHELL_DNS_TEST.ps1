Start-Transcript -Path .\log.txt
(Get-Content .\IPAddresses.txt) | ForEach {Write-Host $_, "-", ([System.Net.NetworkInformation.Ping]::new().Send($_)).Status}
Stop-Transcript

Pause