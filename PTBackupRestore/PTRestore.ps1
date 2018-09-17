# Restore data files

write-host -ForegroundColor Red -Object "     ** You About to overwrite PT data files ! **"
write-host -ForegroundColor Red -Object "     **          Are you sure  Y/N             **"

$a = read-host
 
if($a -eq "y"){
Copy-Item -Path C:\Backupdata\ETH\ProfitTrailerData.json -Destination C:\ProfitTrailerETH-2.0.16\data
Copy-Item -Path C:\Backupdata\BNB\ProfitTrailerData.json -Destination C:\ProfitTrailerBNB-2.0.16\data
Write-Host -ForegroundColor blue " Files Copied !"
}else{
write-host -ForegroundColor Blue " Action Cancelled !"
}
