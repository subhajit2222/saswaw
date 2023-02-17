##service principal
$tenantID = "91f85229-5740-4daf-a419-b35abf126460"
$AppId ="9fa7b83a-e2f1-411e-81ce-993a91dc2dfe"
$AppSecret= "giu8Q~Vi.isoZrJ_Uy.Kp8ZTZ6Lu1i_.muPXvceh"
$SecureSecret= $AppSecret | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-argument $AppId,$SecureSecret
Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID

# count of the number of vms in subscription\

$query = "Resources | where type == 'Microsoft.Compute/virtualMachines'|count"
$result = Search-AzGraph -Query $query
$virtualMachineCount = $result.Count
Write-Output "The number of virtual machines in the subscription is: $virtualMachineCount" 

# Get the Azure Activity Log for the last 30 days for deleted VMs

$activityLog = Get-AzActivityLog -StartTime (Get-Date).AddDays(-30)
$x = $activityLog.OperationName -eq "Delete Virtual Machine" 
$x.Count


