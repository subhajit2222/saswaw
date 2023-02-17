$workdir = "c:\insist"

#check if work dir exists, if not create it

if (Test-Path -Path $workdir -PathType Container)
{
    Write-Host "Dir exists"
}
else {
    New-Item -Path $workdir -ItemType Directory
}

#Download the installer

$source = "https://sourceforge.net/projects/notepadmsi/files/v7.9.1/Notepad%2B%2B7_9_1.msi/download"
$destination = "$workdir\notepad.msi"

#check if invoke web request exists otherwise execute webclient

if (Get-Command 'Invoke-webrequest')
{
    Invoke-WebRequest $source -OutFile $destination
}
else {
    $webclient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source,$destination)
}

#start installation
Start-Process -FilePath "$workdir\notepad.msi" -Wait -ArgumentList '/Silent','/v','/q' -passthru 
