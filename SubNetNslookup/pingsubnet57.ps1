#The aim of this script is to get all the machines on the subnet 10.10.57.xxx
#Created by Francisco Knower

# adds date of the scan
Date > HostIpReport.txt

#constructor
$row = @()

#Does an sort of nslookup on the subnet 57              

write-Output("Hostname                              IP") | out-file -FilePath "HostIpReport.txt" -Append

for($ip = 0; $ip -lt 254; $ip ++){
    $row += [system.net.dns]::resolve("10.10.57.$ip")
    
    if($row[$ip].HostName.Contains("10.10.57")) {
       write-host("Spare IP , " + "                     IP : 10.10.57." + $ip)
       write-output("Spare IP , " + "                     IP : 10.10.57." + $ip) | out-file -FilePath "HostIpReport.txt" -Append
    }
    else {
       Write-Host($row[$ip].HostName + " ,                IP : 10.10.57." + $ip)
       write-output($row[$ip].HostName + " ,              IP : 10.10.57." + $ip) | out-file -FilePath "HostIpReport.txt" -Append
        }

}
