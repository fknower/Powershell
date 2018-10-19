#Sets the internet proxy server for the current user in HCA Healthcare
$reg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
$AutoConfigURL = "http://pac.zscloud.net/hcahealthcare.co.uk/pac01.pac"
set-ItemProperty -path $reg -Name AutoConfigURL -value $AutoConfigURL
#install the Web certificate for the current user
$certPath = "D:\IVF Software\Certificate\ZscalerRootCertificate-2048-SHA256.crt"
Import-Certificate -FilePath $certPath -CertStoreLocation Cert:\CurrentUser\Root 
