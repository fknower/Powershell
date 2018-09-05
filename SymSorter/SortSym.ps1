# reads file and puts it in a array sym
$sym = Get-Content -Path C:\test\powershell\sym.txt -Delimiter ","

#Loop to removes the comma at the end & loop to remove space at begening
 
for($i = 0; $i -le $sym.Length-1;$i++)
    {   
    if($sym[$i].EndsWith(",")){
        $a = $sym[$i].Substring(0,$sym[$i].Length-1)
        $sym[$i] = $a
        }
    if($sym[$i].StartsWith(" ")){
        $a = $sym[$i].Substring(1)
        $sym[$i] = $a
    }

    }
 
#Sorts currency symbols

$a = $sym | Sort-Object 
$a

#adds commas at the end
for($i = 0; $i -le $a.Length-1 ;$i++)
   {
    $a[$i] += ","
   }

#writes file to disk
Set-Content -LiteralPath c:\test\powershell\out.txt -Value $a -NoNewline
