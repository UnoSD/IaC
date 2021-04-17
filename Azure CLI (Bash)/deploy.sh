#!/bin/bash

az group create -n rg-azcli -l WestEurope

az storage account create \
	-n "sa$(tr -dc 'a-z0-9' < /dev/urandom | head -c8)" \
	-g rg-azcli \
	-l WestEurope \
	--sku Standard_LRS