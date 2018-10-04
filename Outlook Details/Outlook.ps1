#This program gets the process details of outlook, the hostname,mac and ip and prints to a file
$Details = ""
$Machine = hostname
$Mac = getmac
$Mac = $Mac -replace "=",""
$Outlook = Get-Process Outlook
$ipStuff = ipconfig
$ipstuff = $ipstuff -match "IPv4 Address"  
$Details = $machine + "`n" + ", Process " + $Outlook.Name  + ", Handles " + $Outlook.Handles + ", Memory " + $Outlook.NPM +", CPU Time "+ $Outlook.TotalProcessorTime + ",`n"
$Details += $ipstuff -match  "IPv4 Address"
$Details += "`n ,Mac" + $Mac 

Set-content -Path "C:\test\Outlook details\outlook.txt" -Value $Details
