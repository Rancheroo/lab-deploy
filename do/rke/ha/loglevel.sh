LEVEL=info # change to debug, etc.
for rancherpod in `kubectl get pods -n cattle-system -l app=rancher --template '{{range.items}}{{.metadata.name}}{{"\n"}}{{end}}'`
  do
    echo $rancherpod
    kubectl exec -n cattle-system $rancherpod -- loglevel --set $LEVEL
  done
