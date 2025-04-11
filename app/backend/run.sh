# Login to ACR
az acr login --name globalshopacr

# Tag & Push
docker build -t globalshopacr.azurecr.io/globalshop-backend:v1 .
docker push globalshopacr.azurecr.io/globalshop-backend:v1
