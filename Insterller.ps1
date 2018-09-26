# runs a installer(setup.exe) to automagicaly install applications on a machine
$InstallerLoc = "LOCATION OF INSTALLER FILE"
$Switches = "SWITCHES TO PROVIDE TO INSTALLER"
$Installer = Start-Process -FilePath $InstallerLoc -ArgumentList $Switches -Wait -PassThru
Write-Host "The exit code is $($Installer.ExitCode)"
