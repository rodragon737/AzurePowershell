##	New-AzLoadBalancer -ResourceGroupName "caracol" -Location centralus -Name "caracolLoadBalancer"
##
##	$publicip = New-AzPublicIpAddress -ResourceGroupName "caracol" -name "caracolpublic" -Location "centralus" -AllocationMethod Static -DomainNameLabel $domainNameLabel -Sku Standard -Tier Global
	$location = 'centralus'
	$publicip =  Read-Host -Prompt "This public ip address"
    $frontend = New-AzLoadBalancerFrontendIpConfig -Name "caracolfronend" -PublicIpAddress $publicip
    $backendAddressPool = New-AzLoadBalancerBackendAddressPoolConfig -Name "caracolbackend"
    $probe = New-AzLoadBalancerProbeConfig -Name "MyProbe" -RequestPath healthcheck.aspx -Protocol http -Port 80 -IntervalInSeconds 15 -ProbeCount 2
    $lbrule = New-AzLoadBalancerRuleConfig -Name "MyLBruleName" -FrontendIPConfiguration $frontend -BackendAddressPool $backendAddressPool -Probe $probe -Protocol Tcp -FrontendPort 80 -BackendPort 80 -IdleTimeoutInMinutes 15 -EnableFloatingIP -LoadDistribution SourceIP -DisableOutboundSNAT
    New-AzLoadBalancer -Name "caracolLoadBalancer" -ResourceGroupName "caracol" -Location $location -FrontendIpConfiguration $frontend -BackendAddressPool $backendAddressPool -Probe $probe -LoadBalancingRule $lbrule -Sku Standard -Tier Global
    Get-AzLoadBalancer -Name "caracolLoadBalancer" -ResourceGroupName "caracol"
