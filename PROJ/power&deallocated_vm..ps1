##find status of virtual machines in subscription & export results in csv for respective status
$counter = Get-AzVM -Status 

$results =@()
foreach ($vm in $counter)
 {
   if ($vm.PowerState -match "VM running")
   {
     $details= @{
        Name=$vm.Name
        Loctaion=$vm.Location
        OStype= $vm.OsName
        Powerstate= $vm.PowerState
                }
     $results += New-Object PSobject -Property $details 
    }          
   else {
   Write-Host "Deallocated Vm name is"  $vm.Name 
   Write-Host "Powerstate:" $vm.PowerState
   }
 }
 $results | Export-Csv -Path "D:\latestproj\outputresult.csv"