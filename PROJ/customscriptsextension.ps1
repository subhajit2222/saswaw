#SERVICEPRINCIPAL
$tenantID = "91f85229-5740-4daf-a419-b35abf126460"
$AppId ="9fa7b83a-e2f1-411e-81ce-993a91dc2dfe"
$AppSecret= "giu8Q~Vi.isoZrJ_Uy.Kp8ZTZ6Lu1i_.muPXvceh"
$SecureSecret= $AppSecret | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-argument $AppId,$SecureSecret
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








