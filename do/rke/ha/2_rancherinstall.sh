#!/bin/bash
export KUBECONFIG=kube_config_cluster.yml
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=brad.do.support.rancher.space --version 2.3.4
kubectl -n cattle-system rollout status deploy/rancher
