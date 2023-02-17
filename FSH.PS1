Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant  $tenantID


#fetching value of storage account 
$Storageaccount = Get-AzStorageAccount -Name $Accountname -ResourceGroupName $resourcegroupname

$Fileshareconfig=@{
    context=$Storageaccount.Context
    name = "datafsh"
}

New-AzStorageShare @Fileshareconfig 

$Directorydetails=@{
    Context = $Storageaccount.Context
    ShareName = "datafsh"
    path = "files"
}

New-AzStorageDirectory  @Directorydetails

$FileDetails=@{
    Context =$Storageaccount.Context
    ShareName = "datafsh"
    Source = ".\temp1.txt"
    path= "/files/temp1.txt"
}

Set-AzStorageFileContent @FileDetails






