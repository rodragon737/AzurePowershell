
###Install-Module -Name Az.Resources -AllowClobber -Scope CurrentUser
###Connect-AzAccount -UseDeviceAuthentication

$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select a AZURE Region'
$form.Size = New-Object System.Drawing.Size(350,420)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,340)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,340)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(200,20)
$label.Text = 'Please select a Region:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(310,20)
$listBox.Height = 280

[void] $listBox.Items.Add('eastus')
[void] $listBox.Items.Add('eastus2')
[void] $listBox.Items.Add('southcentralus')
[void] $listBox.Items.Add('westus2')
[void] $listBox.Items.Add('australiaeast')
[void] $listBox.Items.Add('southeastasia')
[void] $listBox.Items.Add('northeurope')
[void] $listBox.Items.Add('uksouth')
[void] $listBox.Items.Add('westeurope')
[void] $listBox.Items.Add('centralus')
[void] $listBox.Items.Add('northcentralus')
[void] $listBox.Items.Add('westus')
[void] $listBox.Items.Add('southafricanorth')
[void] $listBox.Items.Add('centralindia')
[void] $listBox.Items.Add('eastasia')
[void] $listBox.Items.Add('japaneast')
[void] $listBox.Items.Add('jioindiawest')
[void] $listBox.Items.Add('koreacentral')
[void] $listBox.Items.Add('canadacentral')
[void] $listBox.Items.Add('francecentral')
[void] $listBox.Items.Add('germanywestcentral')
[void] $listBox.Items.Add('norwayeast')
[void] $listBox.Items.Add('switzerlandnorth')
[void] $listBox.Items.Add('uaenorth')
[void] $listBox.Items.Add('brazilsouth')
[void] $listBox.Items.Add('centralusstage')
[void] $listBox.Items.Add('eastusstage')
[void] $listBox.Items.Add('eastus2stage')
[void] $listBox.Items.Add('northcentralusstage')
[void] $listBox.Items.Add('southcentralusstage')
[void] $listBox.Items.Add('westusstage')
[void] $listBox.Items.Add('westus2stage')
[void] $listBox.Items.Add('asia')
[void] $listBox.Items.Add('asiapacific')
[void] $listBox.Items.Add('australia')
[void] $listBox.Items.Add('brazil')
[void] $listBox.Items.Add('canada')
[void] $listBox.Items.Add('europe')
[void] $listBox.Items.Add('global')
[void] $listBox.Items.Add('india')
[void] $listBox.Items.Add('japan')
[void] $listBox.Items.Add('uk')
[void] $listBox.Items.Add('unitedstates')
[void] $listBox.Items.Add('eastasiastage')
[void] $listBox.Items.Add('southeastasiastage')
[void] $listBox.Items.Add('centraluseuap')
[void] $listBox.Items.Add('eastus2euap')
[void] $listBox.Items.Add('westcentralus')
[void] $listBox.Items.Add('westus3')
[void] $listBox.Items.Add('southafricawest')
[void] $listBox.Items.Add('australiacentral')
[void] $listBox.Items.Add('australiacentral2')
[void] $listBox.Items.Add('australiasoutheast')
[void] $listBox.Items.Add('japanwest')
[void] $listBox.Items.Add('koreasouth')
[void] $listBox.Items.Add('southindia')
[void] $listBox.Items.Add('westindia')
[void] $listBox.Items.Add('canadaeast')
[void] $listBox.Items.Add('francesouth')
[void] $listBox.Items.Add('germanynorth')
[void] $listBox.Items.Add('norwaywest')
[void] $listBox.Items.Add('switzerlandwest')
[void] $listBox.Items.Add('ukwest')
[void] $listBox.Items.Add('uaecentral')
[void] $listBox.Items.Add('brazilsoutheast')

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $location = $listBox.SelectedItem
New-AzResourceGroup -Name $resourceGroupName -Location $location
}
