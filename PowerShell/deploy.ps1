New-AzResourceGroup -Name rg-powershell -Location WestEurope

New-AzStorageAccount `
	-Name "sa$(Get-Random)" `
	-ResourceGroupName rg-powershell `
	-Location WestEurope `
	-SkuName Standard_LRS