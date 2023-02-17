$workdir = "c:\installation"

#check if work dir exists, if not create it

if (Test-Path -Path $workdir -PathType Container)
{
    Write-Host "Dir exists"
}
else {
    New-Item -Path $workdir -ItemType Directory
}

#Download the installer

$source = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.2.1/npp.8.2.1.Installer.x64.exe"
$destination = "$workdir\notepad.exe"

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

Start-Process -FilePath "$workdir\notepad.exe" -ArgumentList '/Silent','/v','/q' -PassThru 

