#gets the ip address 
$hops = tracert bmly-core-2b-xe-710-0.network.virginmedia.net;
$line = $hops[5];
$line = $line.remove(0,32);
