#!/bin/bash
export KUBECONFIG=kube_config_cluster.yml
helm install rancher-stable/rancher \
  --name rancher \
  --namespace cattle-system \
  --set hostname=brad.do.support.rancher.space --version 2.2.8
kubectl -n cattle-system rollout status deploy/rancher
