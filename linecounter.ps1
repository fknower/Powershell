# Reads in a file and adds line numbers then outputs to a file

# reads in a file
$code = Get-Content -Path C:\test\powershell\LineCounter\exampleFile.txt

# Inserts a line number at the start of each line

for($i = 0; $i -le $code.Length-1;$i++)
{
$lineNum = $i + 1
$code[$i] = $code[$i].Insert(0,($lineNum.ToString())+' ')
}

#outputs to file out.txt
Set-Content -Path C:\test\powershell\LineCounter\out.txt -value $code
