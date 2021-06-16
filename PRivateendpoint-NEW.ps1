$SubscriptionId = Read-Host -Prompt "The Azure SubscriptionId in which to create these endpoint"
$VirtualNetworkname =  Read-Host -Prompt "The Azure virtual network name to work"
$resourceGroupName = Read-Host -Prompt "The Resource Group to make endpoint"
$location = 'centralus'
$FE = 'frontendSubnet'
$BE = 'backendSubnet'
$MyPLServConnections = Read-Host -Prompt "Insert the name of this private service to connect"
$PrivateEndpoint = Read-Host -Prompt "Insert the name of this private endpoint"


    $virtualNetwork = Get-AzVirtualNetwork -ResourceName $VirtualNetworkname -ResourceGroupName $resourceGroupName
    $subnet = $virtualNetwork | Select-Object -ExpandProperty subnets | Where-Object Name -eq $BE
	$plsConnection= New-AzPrivateLinkServiceConnection -Name $MyPLServConnections -PrivateLinkServiceId '/subscriptions/$SubscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Network/privateLinkServices/$MyPLServConnections' -RequestMessage 'Please Approve my request'
New-AzPrivateEndpoint -Name $PrivateEndpoint -ResourceGroup $resourceGroupName -Location $location -PrivateLinkServiceConnection $plsConnection -Subnet $subnet