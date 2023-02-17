Disable-azContextAutosave
$resourcegroupname= "rgnew"
$location = "EastUS"
$tenantID = "91f85229-5740-4daf-a419-b35abf126460"

$AppId ="9fa7b83a-e2f1-411e-81ce-993a91dc2dfe"
$AppSecret= "giu8Q~Vi.isoZrJ_Uy.Kp8ZTZ6Lu1i_.muPXvceh"

$SecureSecret= $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-argument $AppId,$SecureSecret


Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID
New-AzResourceGroup -ResourceGroupName $resourcegroupname -Location $location 