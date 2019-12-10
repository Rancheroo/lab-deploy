#!/bin/bash
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=braddo.support.rancher.space
kubectl -n cattle-system rollout status deploy/rancher
