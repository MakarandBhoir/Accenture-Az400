az group create --name TrainingRG --location westus

az deployment group create --resource-group TrainingRG --template-file ./01-storage.bicep

az deployment group create -g TrainingRG --template-file 02-storage-parameter.bicep

az deployment group create -g TrainingRG --template-file 03-storage-parameter-file.bicep --parameters @03-parameter.json

az group delete --name TrainingRG --yes --no-wait
