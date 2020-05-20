#!/bin/bash
export KUBECONFIG=kube_config_cluster.yml
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=brad.do.support.rancher.space \
  --version 2.4.3 \
  --set auditLog.level=1
kubectl -n cattle-system rollout status deploy/rancher
