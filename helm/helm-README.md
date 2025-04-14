Helm Installation Guide for Linux
If you encounter the error:

csharp

Command 'helm' not found, but can be installed with:
sudo snap install helm
It means Helm is not currently installed on your system. Use one of the following methods to install it:

✅ Recommended: Install via Script (Official Method)
This is the quickest and most reliable way to install Helm:


curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
🛠️ Alternative: Install via Snap (as suggested)
Install Helm using Snap:

sudo snap install helm --classic
⚠️ Note: Some users experience permission or path issues with Snap, especially inside Docker containers or restricted environments.

📦 Install via APT (Advanced Package Tool)
This method offers more control over the installation:


sudo apt update
sudo apt install apt-transport-https --yes
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update
sudo apt install helm
✅ Verify Helm Installation
Once installed, check that Helm is working correctly:


helm version
🚀 Create Helm Charts for Your Project
After installation, you can create Helm charts using:


helm create globalshop-backend
helm create globalshop-frontend
This will scaffold chart directories with default templates and values.

Need help customizing the charts (e.g., values, ingress, service types)? Just ask!
Troubleshooting Helm and Kubernetes Deployment Issues
Overview
This document outlines the steps to resolve issues encountered during the deployment of the GlobalShop application using Helm on Kubernetes, including problems related to image pull errors, service setup, and the need for configuration adjustments.

Problem 1: ImagePullBackOff for Pods
Error:
The following error was encountered while deploying the backend and frontend services:


kubectl get pods
NAME                                  READY   STATUS             RESTARTS   AGE
globalshop-backend-8bcf76bf9-sxftg    0/1     ErrImagePull       0          31s
globalshop-frontend-659df5d8d-5t4zx   0/1     ImagePullBackOff   0          21s
This error is caused when Kubernetes cannot pull the Docker images from the registry.

Solution:
Check Image URL: Ensure the correct image URL is used in your deployment.yaml files, such as:

globalshopacr.azurecr.io/globalshop-backend:v1

globalshopacr.azurecr.io/globalshop-frontend:v1

Authenticate to Azure Container Registry (ACR):

Run the following command to log in to Azure:


az acr login --name globalshopacr
Check Network Connectivity: The error might be related to DNS or network issues. Verify that you have internet connectivity and DNS resolution working on your Kubernetes nodes.

Verify Docker Images: Ensure that the images are properly tagged and available in ACR. You can do this by logging into the Azure portal or using the Azure CLI.

Problem 2: Cannot Re-Use a Name That is Still in Use
Error:
While trying to install the Helm charts, the following error was encountered:


helm install globalshop-backend ./globalshop-backend
Error: INSTALLATION FAILED: cannot re-use a name that is still in use
Solution:
Check for Existing Helm Releases:

List existing Helm releases:

helm list --all-namespaces
Uninstall Existing Releases:

If you find a release that already exists, uninstall it:


helm uninstall globalshop-backend
helm uninstall globalshop-frontend
Re-Install Helm Charts:

After uninstalling, you can re-install your Helm charts:


helm install globalshop-backend ./globalshop-backend
helm install globalshop-frontend ./globalshop-frontend
Problem 3: Accessing the Application Through Port Forwarding
Error:
The pods are deployed, but the services are not accessible. The following command was run for accessing the frontend:


kubectl port-forward globalshop-frontend 4001:4001
Solution:
Port Forwarding for Access:

Run the following commands to set up port forwarding for the frontend and backend:


kubectl port-forward service/globalshop-frontend 4001:4001
kubectl port-forward service/globalshop-backend 4000:4000
Verify Services:

Ensure that your services are correctly configured:


kubectl get svc
Access Application:

Once the port forwarding is set up, you can access the frontend at http://127.0.0.1:4001 and the backend at http://127.0.0.1:4000.

Problem 4: Service Not Accessible Due to Incorrect Port Settings
Solution:
Update Helm Values:

Update the values.yaml file for both frontend and backend with the correct port numbers (e.g., 4000 for backend and 4001 for frontend).

Update Deployment Files:

In the deployment.yaml files for both frontend and backend, ensure that the containerPort and servicePort are correctly set to 4000 and 4001.

Example for frontend:


ports:
  - containerPort: 4001
    name: http
    protocol: TCP
Example for backend:


ports:
  - containerPort: 4000
    name: http
    protocol: TCP
Re-deploy Helm Charts:

After making the necessary changes, redeploy the Helm charts:


helm upgrade --install globalshop-backend ./globalshop-backend
helm upgrade --install globalshop-frontend ./globalshop-frontend
