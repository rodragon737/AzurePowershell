$SQLSubscriptionId = Read-Host -Prompt "The Azure SubscriptionId in which to create these objects"
##$SQLadminSqlLogin = Read-Host -Prompt "Enter the admin SQL"
##$SQLpassword = Read-Host -Prompt "Enter the password admin SQL"
$SQLserverName = Read-Host -Prompt "Enter name SQL Server"
$SQLdatabaseName = Read-Host -Prompt "Enter name of Database"
$SQLstartIp = Read-Host -Prompt "The start ip address range that you want to allow to access your server"
$SQLendIp = Read-Host -Prompt "The end ip address range that you want to allow to access your server"
$resourceGroupName = Read-Host -Prompt "The Resource Group to make SQL"
$location = 'centralus'
Set-AzContext -SubscriptionId $SQLSubscriptionId 
New-AzSqlServer -ResourceGroupName $resourceGroupName -location $location -ServerName $SQLserverName -ServerVersion "12.0" -SqlAdministratorCredentials (Get-Credential)
New-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName -ServerName $SQLserverName -FirewallRuleName "AllowedIPs" -StartIpAddress $SQLstartIp -EndIpAddress $SQLendIp