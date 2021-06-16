    $frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
    $backendSubnet  = New-AzVirtualNetworkSubnetConfig -Name backendSubnet  -AddressPrefix "10.0.2.0/24"
	
New-AzVirtualNetwork -Name VirtualNetwork -ResourceGroupName caracol -Location centralus -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet,$backendSubnet -DnsServer 10.0.1.5,10.0.1.6

New-AzNetworkInterface -Location centralus -Name 'NetworkInterface1' -PrivateIpAddress '10.0.1.10' -ResourceGroupName 'caracol' -SubnetId '/subscriptions/692370b4-fa9b-4329-9f38-daa3d1b2e410/resourceGroups/caracol/providers/Microsoft.Network/virtualNetworks/VirtualNetwork/subnets/frontendSubnet'
New-AzNetworkInterface -Location centralus -Name 'NetworkInterface2' -PrivateIpAddress '10.0.2.10' -ResourceGroupName 'caracol' -SubnetId '/subscriptions/692370b4-fa9b-4329-9f38-daa3d1b2e410/resourceGroups/caracol/providers/Microsoft.Network/virtualNetworks/VirtualNetwork/subnets/backendSubnet'