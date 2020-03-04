# Custom Default Backend for Nginx Ingress Controller

This repo contains the code and setup files that work with the latest **Helm** installation of [Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/#using-helm). 


To integrate with Helm: 
  * Create the k8s resources: 
  ```
  kubectl apply -f custom_default_backend.yaml
  ```
  * Delete previous Nginx Ingress Controller Helm installation: 
  ```
  helm delete nginx-ingress -n ingress-nginx
  ```
  * Install it again with proper `--set` flags: 
  ```
  helm install nginx-ingress --namespace ingress-nginx stable/nginx-ingress --set defaultBackend.enabled=false,controller.defaultBackendService=ingress-nginx/custom-default-backend
  ```
  