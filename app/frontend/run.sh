# Login to ACR (if not already)
az acr login --name globalshopacr

# Tag & Push React frontend image
docker build -t globalshopacr.azurecr.io/globalshop-frontend:v1 .
docker push globalshopacr.azurecr.io/globalshop-frontend:v1
