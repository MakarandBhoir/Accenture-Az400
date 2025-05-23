az group create --location westus --resource-group TrainingRG

az deployment group create --resource-group TrainingRG --template-file ./nested-template.json

az group delete --name TrainingRG --yes --no-wait