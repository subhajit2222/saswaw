########################################################
# Start or Stop VM
########################################################
# Check for incompatible actions
if (($VirtualMachineAction -eq "Start" -And $myVirtualMachineState -eq "PowerState/running") -Or ($VirtualMachineAction -eq "Stop" -And $myVirtualMachineState -eq "PowerState/deallocated"))
{
    Write-Error "Cannot $($VirtualMachineAction) $($VirtualMachineName) while the status is $($myVirtualMachineState)"
    return
}
# Resume Azure Analysis Services
elseif ($VirtualMachineAction -eq "Start")
{
    Write-Output "Now starting $($VirtualMachineName)"
    Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VirtualMachineName -Confirm:$false
}
# Pause Azure Analysis Services
else
{
    Write-Output "Now stopping $($VirtualMachineName)"
    $null = Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VirtualMachineName -Confirm:$false -Force
}
 
 
 
########################################################
# Show when finished
########################################################
$Duration = NEW-TIMESPAN –Start $StartDate –End (GET-DATE)
Write-Output "Done in $([int]$Duration.TotalMinutes) minute(s) and $([int]$Duration.Seconds) second(s)"