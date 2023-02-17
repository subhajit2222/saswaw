Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID

#creation of resource group
$resourcegroupname = "powershell-grp"
$location = "EastUS"

New-AzResourceGroup -ResourceGroupName $resourcegroupname -Location $location

# creation of storage account

$Accountname = "mystgaccount23232261"
$AccountKind = "StorageV2"
$AccountSku = "Standard_LRS"


$Storageaccount = New-AzStorageAccount -Name $Accountname -ResourceGroupName $resourcegroupname `
-Kind $AccountKind -SkuName $AccountSku -Location $location