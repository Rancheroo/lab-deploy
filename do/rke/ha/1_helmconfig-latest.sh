#!/bin/bash
export KUBECONFIG=kube_config_cluster.yml
# helm repo add rancher-stable https://releases.rancher.com/server-charts/stable \
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml \
&& kubectl create namespace cert-manager \
&& kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true \
&& helm repo add jetstack https://charts.jetstack.io \
&& helm repo update \
&& helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.12.0
kubectl get pods --namespace cert-manager -w
