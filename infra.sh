# For creating the AKS cluster and ACR

AKS_RG=""
AKS_REGION=""
AKS_CLUSTER=""
ACR_NAME=""

az group create --name $AKS_RG --location $AKS_REGION
az aks create --resource-group $AKS_RG --name $AKS_CLUSTER --node-count 2 --enable-addons monitoring
az acr create --resource-group $AKS_RG --name $ACR_NAME --sku Basic --location $AKS_REGION
az ask update --name $AKS_CLUSTER --resource-group $AKS_RG --attach-acr $ACR_NAME
az aks get-credentials --resource-group $AKS_RG --name $AKS_CLUSTER
kubectl create namespace <namespace>


# clean up
az group delete --name $AKS_RG --yes --no-wait