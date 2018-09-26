# Gets ipconfig /all innformation and writes it to a file in the name of the machines hostname.
$ip = ipconfig /all;
#finds the hostname 
$line = $ip[3];
$hostname = $line -split "\:",2;
#adds .txt to the hostname so we have a proper filename
$hostname = ($hostname[1] + ".txt");
# removes spaces from the begining and end of a string
$hostname = $hostname.trim();
#Save file as the computers hostname.
set-content -LiteralPath C:\test\powershell\ipconfigs\$hostname -value $ip
