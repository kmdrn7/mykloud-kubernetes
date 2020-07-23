## Step Instalasi NGINX Ingress Controller
- apply mandatory.yaml untuk melakukan konfigurasi awal NGINX Ingress Controller
- apply service-nodeport.yaml untuk melakukan konfigurasi secara spesifik untuk bare-metal

## Step Instalasi Menggunakan HELM 3
- helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
- helm install my-release ingress-nginx/ingress-nginx