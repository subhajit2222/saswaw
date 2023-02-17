$strtaskname= "Powwershell test"
$struser="Admin"
$strpassword ="password123"
$strdescription = "This is a scheduler task"
$strTaskPath="C:\pow"
$strtaskname="my task"
$strexec = "$($PSHOME)\powershell.exe"
$strArg = "-File D:\power\PROJ\main.ps1"
$settings = New-ScheduledTaskSettingsSet
$objAction =New-ScheduledTaskAction -Execute $strexec -argument $strArg
$objtrigger = New-ScheduledTaskTrigger -Daily -at 6pm
$objprincipal = New-ScheduledTaskPrincipal -UserID "lOCALsERVICE" -LogonType ServiceAccount

$objTask = New-ScheduledTask -Action $objAction -Trigger $objtrigger -Description $strdescription -Principal $objprincipal -Settings $settings
Register-ScheduledTask -TaskPath $strTaskPath -Taskname $strtaskname -Action $objTask




$Trigger= New-ScheduledTaskTrigger -At 10:00am -Daily
$User= "NT AUTHORITY\SYSTEM"
$Action= New-ScheduledTaskAction -Execute $strexec -Argument $strArg 
Register-ScheduledTask -TaskName "StartupScript1" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force


$action = New-ScheduledTaskAction -Execute "D:\power\PROJ\main.ps1"
$trigger = New-ScheduledTaskTrigger -At 10:00am -Daily
$principalac= Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID
$principal = "subanik1995_gmail.com#EXT#@subanik1995gmail.onmicrosoft.com"
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask T1 -InputObject $task 





$ps.versiontab;e



