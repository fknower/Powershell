#Gets mapped printers on a windows 7 machine. not using get-printer cmdlet
$a = Get-WmiObject -Class Win32_Printer

#Removes junk into a new array

#initialize empty array
$b=@()

#Removes unneeded elements and stores the result in a new array

for($i = 0; $i -lt $a.Length;$i++){
     if($a[$i].Name -ne "Microsoft XPS Document Writer" -and $a[$i].Name -ne "Send To OneNote 2016" -and $a[$i].Name -ne "Microsoft Print to PDF"){
#Adds element to array
   $b += $a[$i]
     }
}

#store result in a file
Set-Content -LiteralPath C:\test\powershell\Printers\PrinterList.txt -Value $b
