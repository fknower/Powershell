# Gets the hostnames from a file HostIPReport.txt and reports if the hostnames are on line
$a = get-Content D:\HostIPReport.txt

$a | foreach-object($_){
    #gets hostname from array of string
    $b = $_ -split("\s",2)
    if($b[0] -ne '1'){
    #ping hostname
    $online = Test-Connection $b[0] -Quiet
    Write-Host "Host " $b[0] "Online " $Online
    $report += "Host " + $b[0] + "Online " + $Online + "`n"
    }
}

$report > d:\hostping.txt
