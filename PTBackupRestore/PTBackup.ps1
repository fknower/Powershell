# backs up 2 files every 60 minuites from execution

while($true){
    sleep 3600
    Write-Host -ForegroundColor blue "** coping C:\ProfitTrailerETH-2.0.16\data\ProfitTrailerData.json to C:\Backupdata\ETH **"
    Write-Host -ForegroundColor blue "** coping C:\ProfitTrailerBNB-2.0.16\data\ProfitTrailerData.json to C:\Backupdata\BNB **"
    Copy-Item -Path C:\ProfitTrailerETH-2.0.16\data\ProfitTrailerData.json -Destination C:\Backupdata\ETH
    Copy-Item -Path C:\ProfitTrailerBNB-2.0.16\data\ProfitTrailerData.json -Destination C:\Backupdata\BNB
    }
