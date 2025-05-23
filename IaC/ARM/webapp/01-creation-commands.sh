az group create --location westus --resource-group TrainingRG

az deployment group create --resource-group TrainingRG --template-file 01-appserviceplan.json  --parameters 01-appserviceparameter.json

az deployment group create --resource-group TrainingRG --template-file 01-webapp.json

az group delete --name TrainingRG --yes --no-wait

