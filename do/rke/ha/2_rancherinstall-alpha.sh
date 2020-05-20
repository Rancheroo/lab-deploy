#!/bin/bash
export KUBECONFIG=kube_config_cluster.yml
helm install rancher rancher-alpha/rancher \
  --namespace cattle-system \
  --set hostname=brad.do.support.rancher.space
kubectl -n cattle-system rollout status deploy/rancher
