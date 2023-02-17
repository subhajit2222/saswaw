$Accountname = "mystgaccount23232261"
$resourcegroupname = "powershell-grp"
$location = "EastUS"

$Storageaccount = Get-AzStorageAccount -Name $Accountname -ResourceGroupName $resourcegroupname

#creation of a blob container
$ContainerName = "data"
New-AzStorageContainer -Name $ContainerName -Context $Storageaccount.Context `
-Permission Blob

#hash table to input the path of file to be uploaded & the file name to appear in blob 
$blobobject=@{
    Filelocation = ".\temp1.txt"
    Objectname = "temp.txt"
}
#uploading file to blob calling hash table values
Set-AzStorageBlobContent -Context $Storageaccount.Context -Container $ContainerName `
-File $blobobject.Filelocation -Blob $blobobject.Objectname\

