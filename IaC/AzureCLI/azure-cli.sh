#Create Resource Group
az group create -n az900 -l eastus

#List Resource Group
az group list
az group list -o table
az group list -o tsv
az group list -o json
az group list -o jsonc

az group list --query "[].name"
az group list --query "[].{myrgname:name, mylocaton:location}"
az group list --query "[?location=='eastus']"
az group list --query "[?location=='eastus'].name"
az group list --query "[?location=='eastus'].{myrgname:name, mylocaton:location}"


#Delete Resource Group
az group delete -n az900


#Create VM
az vm create -n MyVm -g az900 -l eastus --image Ubuntu2404 --admin-username makarand --admin-password makarand@1234
az vm create -n MyVm -g az900 -l eastus --image Ubuntu2404 --admin-username makarand --generate-ssh-keys

#To Connect using ssh
ssh makarand@20.163.241.54



#Stop VM
az vm stop -n MyVm -g az900

#Start VM & do not wait
az vm start -n MyVm -g az900 --no-wait

#Restart VM
az vm restart -n MyVm -g az900

#Delete Resource Group in which vm is present
az group delete -n az900 --no-wait


#Appservice Plan Create
az appservice plan create -g az900 -n myplan-1
az appservice plan delete -n myplan1 -g az900


#Create/Stop/Start/Delete Webapp
az webapp create -n mywebapp211222 -p myplan1 -g az900
az webapp stop -n mywebapp211222 -g az900
az webapp start -n mywebapp211222 -g az900
az webapp restart -n mywebapp211222 -g az900
az webapp delete -n mywebapp211222 -g az900


az appservice plan create --name myAppServicePlan --resource-group myResourceGroup --sku B1 --is-linux
az webapp create --resource-group myResourceGroup --plan myAppServicePlan --name myWebApp --runtime "php|7.4"


#Create storage account
az storage account create --name mystorageaccount --resource-group myresourcegroup --sku Standard_LRS
az storage account create --name mystorageaccount --resource-group myresourcegroup --sku Standard_LRS --kind StorageV2 --access-tier Hot --replication-type LRS

