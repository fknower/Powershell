#Gets Printer Information on a windows 7 machine. not using get-printer cmdlet
$a = Get-WmiObject -Class Win32_Printer
#Initilizes Object
$b = @()
#Removes junk into a new array $_ is the current object
$a | ForEach-Object($_.Name){
$remove = 0
  switch($_.Name){
   "Send To OneNote 2016" {$remove = 1; break}
   "Microsoft XPS Document Writer" {$remove = 1; break}
   "Microsoft Print to PDF" {$remove = 1; break}
   }
   if($remove -eq 0 ){
   $b += $_
   }
}
#store result in a file
Set-Content -LiteralPath C:\test\powershell\Printers\PrinterList.txt -Value $b
