Disable-azContextAutosave

#Parameterized input
$resourcegroupname= "newresourcegroup"
$location = "EastUS"

$tenantID = "91f85229-5740-4daf-a419-b35abf126460"

$AppId = "9fa7b83a-e2f1-411e-81ce-993a91dc2dfe"
$AppSecret = "mOG8Q~jlx2Wx2SZF5Q3bLDp-vTOrhfWW7.7E6bMI"

$SecureSecret= $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-argument $AppId,$SecureSecret

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID

New-AzResourceGroup -ResourceGroupName $resourcegroupname -Location $location



