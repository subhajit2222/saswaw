# 3 to 4 VMs are running - need to switch off or shutdown at 06:09 PM ,if shutdown ,display shutdown. If there is any tag in VM, it shouldn't shutdown. 

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID
$totalVMdetails = Get-AzVM 
$results =@()
$values =@()
foreach ($vm in $totalVMdetails)
{
 $x=$vm.Tags.Keys
 if($x -ne '$null'){
    $data=@{
        name=$vm.name
    }
    $results += New-Object PSobject -Property $data
  }
else {
  $values=@{
    name=$vm.Name
  }
  $output += New-Object PSObject -Property $values
  Stop-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Confirm:$false -Force
}
}
Write-Host "List of VMs tagged " $results.name
Write-Host "List of deallocated untagged VMs" $output.name



