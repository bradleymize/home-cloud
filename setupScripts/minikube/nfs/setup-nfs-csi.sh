#!/bin/bash

# https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/README.md

helm repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
helm install csi-driver-nfs csi-driver-nfs/csi-driver-nfs --namespace kube-system --version v4.5.0