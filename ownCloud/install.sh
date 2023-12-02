#!/bin/bash

helm upgrade -i -n mycloud mycloud owncloud/owncloud -f values.yaml --create-namespace

kubectl -n mycloud patch ingress mycloud-owncloud \
  --type=json \
  -p '[{"op":"replace","path":"/spec/rules/0/http/paths/0/path","value":"/cloud"}]'

kubectl -n mycloud patch ingress mycloud-owncloud \
  --type=json \
  -p '[{"op":"replace","path":"/spec/rules/0/host","value":"minikube"}]'