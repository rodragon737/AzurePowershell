# Connect-AzAccount
# The SubscriptionId in which to create these objects
$SubscriptionId = '692370b4-fa9b-4329-9f38-daa3d1b2e410'
# Set the resource group name and location for your server
$resourceGroupName = 'caracol'
$location = "centralus"
# Set an admin login and password for your server
$adminSqlLogin = "roro"
$password = "roroPassword"
# Set server name - the logical server name has to be unique in the system
$serverName = 'sqlcaracol'
# The sample database name
$databaseName = 'caracolDatabase'
# The ip address range that you want to allow to access your server
$startIp = "0.0.0.0"
$endIp = "0.0.0.0"

# Set subscription 
Set-AzContext -SubscriptionId $subscriptionId 

# Create a resource group
$resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a server with a system wide unique server name
$server = New-AzSqlServer -ResourceGroupName $resourceGroupName 
    -ServerName $serverName 
    -Location $location 
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))

# Create a server firewall rule that allows access from the specified IP range
$serverFirewallRule = New-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName 
    -ServerName $serverName 
    -FirewallRuleName "AllowedIPs" -StartIpAddress $startIp -EndIpAddress $endIp

# Create a blank database with an S0 performance level
$database = New-AzSqlDatabase  -ResourceGroupName $resourceGroupName 
    -ServerName $serverName 
    -DatabaseName $databaseName 
    -RequestedServiceObjectiveName "S0" 
    -SampleName "AdventureWorksLT"

# Clean up deployment 
# Remove-AzResourceGroup -ResourceGroupName $resourceGroupName##

##New-AzSqlServer -ResourceGroupName "caracol" -location centralus -ServerName "sqlcaracol" -ServerVersion "12.0" -SqlAdministratorCredentials (Get-Credential)