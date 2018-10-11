#Reads in room names. Pings the machine in the room if its on the 10.10.57 subnet
#outputs a report to a csv file that can be opened in excel

$a = Get-ChildItem -File -Filter *.txt -Recurse
#constructor for empty CVS objects
$CSVContent =@()
$row = @()
#read each config file and get hostname and Ip store all machines on subnet 57 into an array
$csv += "Hostname,ip"
$a | foreach($_.Fullname){
# excludes items in the base directory
    if($_.FullName.Length -gt 17){
    $config = get-content -Path $_.Fullname
    $Location = $config[2]
#Splits the string in to 2 using the split function than trims the spaces and stores the result in hostname
    $hostname = ($config[3].Split(":",2))[1].trim()
    $ip = $config | Where-Object {$_ -match "IPv4 Address" -and "(Prefered)"}
    If($ip -ne $null){
        $ip = $ip.Trimstart("IPv4 Address. . . . . . . . . . . : ")
    }else {
        $ip = "None"
    }
    $connection = Test-Connection $hostname -Quiet

    # creates a new object 
    $row = New-Object System.Object 
    #Adds new CSV Row content
    $row | Add-Member -MemberType NoteProperty -Name "Location" -Value $Location
    $row | Add-Member -MemberType NoteProperty -Name "Hostname" -Value $hostname
    $row | add-member -MemberType NoteProperty -Name "IP Address" -Value $ip
    $row | Add-Member -MemberType NoteProperty -Name "Alive" -Value $connection 
    $CSVContent += $row
    }
}
$CSVContent | export-csv d:\HostDetails.csv
