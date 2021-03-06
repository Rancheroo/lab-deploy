#!/bin/bash
cmanver=0.9.1
cmancutver=$(echo $cmanver | cut -f1-2 -d.)
export KUBECONFIG=kube_config_cluster.yml
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system;
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-$cmancutver/deploy/manifests/00-crds.yaml \
&& kubectl create namespace cert-manager \
&& kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true \
&& helm repo add jetstack https://charts.jetstack.io \
&& helm repo update \
&& helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version $cmanver
kubectl get pods --namespace cert-manager -w
