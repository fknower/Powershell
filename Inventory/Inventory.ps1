# Config.sys /all > hostname.txt stored on a folder named after the room 
# This program parses the folders to get the room name, the computers hostname stored on the filename, the ip and mac address stored in the file.

#Gets the Room name, Which is the foldername
$Rooms = (Get-ChildItem -Directory).Name
#initilize an empty array
$list = @()
#iterates thru rooms
for($i=0; $i -lt $Rooms.Length; $i++){
#Stores the Path
$path = "\"+$rooms[$i]+"\"
    #stores the filename 
    $HostName = (Get-ChildItem -File -path $path).Name
    
    if($Hostname -is [Array]){
    $Size = $Hostname.length
    }else {
    $Size = 1
    } 
        for($a = 0;$a -lt $Size; $a++){ 
            #read in file           
            If($HostName -is [Array]){
            $ConfigsysFilePath = $path + $HostName[$a]
            }else{
            $ConfigsysFilePath = $path + $HostName
            }
            #Parse file to get Ip & Host
            $ConfigSys = Get-Content -Path $ConfigsysFilePath
            #Gets the mac address
            $Mac = $ConfigSys | Select-String -Pattern "Physical Address"
            #gets rid of .
            $Mac = $Mac -replace "\. ",""
            #gets rid of empty macs
            $Mac =$Mac -replace "Physical Address: 00-00-00-00-00-00-00-E0",""
            $IP = $ConfigSys | Select-String -Pattern "IPv4 Address"
            #gets rid of .
            $iP = $IP -replace "\. ", ""  
            if($HostName -is [Array]){
                $line = $Rooms[$i] + " Hostname :" + $HostName[$a] + $Mac + $IP + "`n"
                $list += $line
            }else{
                $line = $Rooms[$i] + " Hostname :" + $HostName + $Mac + $IP + "`n"
                $list += $line
            }
        }
}
Set-Content -LiteralPath d:\inventory.txt -Value $list
