Refer github/todos-backend/build/k8s/helm/README

# Install traefik crd's
helm install traefik-crd ./traefik-crd

# Verify
kubectl get CustomResourceDefinition --all-namespace
