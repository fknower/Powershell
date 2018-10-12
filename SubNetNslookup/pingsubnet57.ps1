#The aim of this script is to get all the machines on the subnet 10.10.57.xxx

#constructor
$row = @()
#Does an sort of nslookup on the subnet 57
for($ip = 1; $ip -lt 254; $ip ++){
    $row += [system.net.dns]::resolve("10.10.57.$ip")
}
$row > HostIpReport.txt
