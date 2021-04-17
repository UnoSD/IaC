New-AzResourceGroup -Name rg-psarm -Location "West Europe"

Publish-PSArmTemplate -Path ./deploy.psarm.ps1

New-AzResourceGroupDeployment -ResourceGroupName rg-psarm -TemplateFile ./template.json