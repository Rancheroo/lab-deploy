#!/bin/bash
export KUBECONFIG=kube_config_cluster.yml
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=brad.do.support.rancher.space \
  --version 2.4.2
kubectl -n cattle-system rollout status deploy/rancher
