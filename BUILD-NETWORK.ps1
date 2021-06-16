$SubscriptionId = Read-Host -Prompt "The Azure SubscriptionId in which to create these objects"
$VirtualNetworkname =  Read-Host -Prompt "The Azure virtual network name to create"
$VNaddress = Read-Host -Prompt "IP address to create this virtual network, like x.x.x.x/xx "
$resourceGroupName = Read-Host -Prompt "The Resource Group to make Virtual Network"
$location = 'centralus'
$FE = 'frontendSubnet'
$BE = 'backendSubnet'
$FEaddress = Read-Host -Prompt "IP address to create this frontend subnet, like x.x.x.x/xx "
$FEipa = Read-Host -Prompt "IP address to create this frontend interface, like x.x.x.x "
$BEaddress = Read-Host -Prompt "IP address to create this backend subnet, like x.x.x.x/xx "
$BEipa = Read-Host -Prompt "IP address to create this backend interface, like x.x.x.x "
$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name $FE -AddressPrefix $FEaddress
$backendSubnet  = New-AzVirtualNetworkSubnetConfig -Name $BE  -AddressPrefix $BEaddress
$frontendinterface = $VirtualNetworkname+'frontend'
$backendinterface  = $VirtualNetworkname+'backend'
$DnsServer1 = Read-Host -Prompt "IP address to 1°DNS, like x.x.x.x"
$DnsServer2 = Read-Host -Prompt "IP address to 2°DNS, like x.x.x.x"

	
New-AzVirtualNetwork -Name $VirtualNetworkname -ResourceGroupName $resourceGroupName -Location $location -AddressPrefix $VNaddress -Subnet $frontendSubnet,$backendSubnet -DnsServer $DnsServer1, $DnsServer2

New-AzNetworkInterface -Location $location -Name "$frontendinterface" -PrivateIpAddress $FEipa -ResourceGroupName $resourceGroupName -SubnetId "/subscriptions/$SubscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$VirtualNetworkname/subnets/$FE"
New-AzNetworkInterface -Location $location -Name "$backendinterface" -PrivateIpAddress $BEipa -ResourceGroupName $resourceGroupName -SubnetId "/subscriptions/$SubscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/virtualNetworks/$VirtualNetworkname/subnets/$BE"