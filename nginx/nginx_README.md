### Setting Up Ingress NGINX on AKS Using Helm

#### ✅ Prerequisites:
- Azure CLI installed and logged in
- Helm installed
- kubectl installed and configured
- Access to the AKS cluster

---

### 🔹 Step 1: Connect to the AKS Cluster

Run the following command to merge your AKS credentials with your kubeconfig:

```bash
az aks get-credentials --resource-group rg-globalshop --name aks-globalshop
```

If prompted to overwrite existing configuration, type `y`.

Verify connection:
```bash
kubectl get nodes
```
Expected output:
```
NAME                              STATUS   ROLES    AGE     VERSION
aks-default-xxxxxx-vmss000000     Ready    <none>   Xm      v1.xx.x
...
```

---

### 🔹 Step 2: Add the Ingress NGINX Helm Repository

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

---

### 🔹 Step 3: Install Ingress NGINX

```bash
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace ingress-nginx
```

If you see an error about DNS resolution or cluster unreachable:
- Ensure the AKS cluster is not private or you are connected via VPN/bastion if it is.
- Recheck kubeconfig and network settings.

---

### 🔹 Step 4: (Optional) Clean Up Previous Installations

If there was a failed install attempt:

```bash
helm uninstall ingress-nginx -n ingress-nginx || true
kubectl delete namespace ingress-nginx || true
```
Then reinstall using the command from Step 3.

---

### ✅ Done!
You’ve now installed Ingress NGINX on your AKS cluster. You can verify the installation with:

```bash
kubectl get pods -n ingress-nginx
```

Let me know if you want to configure routing or TLS next!

