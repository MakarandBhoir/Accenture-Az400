az group create --location westus --resource-group TrainingRG

az deployment group create --resource-group TrainingRG --template-file 01-storage-acc.json

az group delete --name TrainingRG --yes --no-wait