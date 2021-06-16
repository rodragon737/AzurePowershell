$SQLserverName = Read-Host -Prompt "Enter name SQL Server"
$resourceGroupName = Read-Host -Prompt "The Resource Group to make SQL"
$SQLdatabaseName = Read-Host -Prompt "Enter name of Database"
$SQLdatabaseTestName = $SQLdatabaseName+"TEST"
New-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $SQLserverName -DatabaseName $SQLdatabaseName
New-AzSqlDatabase -ResourceGroupName $resourceGroupName -ServerName $SQLserverName -DatabaseName $SQLdatabaseTestName