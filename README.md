# home-cloud

## Overview

`home-cloud` is designed to be a standalone, self-hosted, (relatively) secure cloud solution utilizing kubernetes/helm.

## Features

* TLS terminating reverse proxy - ensures traffic coming to the kubernetes cluster is encrypted (HTTPS), but decrypts it once inside
* Automatic routing - Single reverse proxy route mean no need to update the reverse proxy for new helm charts that get added
  * Requires helm charts to be configured with Service type of `LoadBalancer` and Ingress rules that use a path prefix with host matching
* Client certificate validation - ensures only devices you allow (via installing the client certificates) can access the kubernetes cluster
* NFS server - allows for persisting data from apps running within the kubernets cluster, outside the cluster
* NFS CSI helm driver - allow for dynamically provisioning PersistentVolumeClaims on the NFS server
* Config file + Installation scripts - easily get up and running via the configuration file and setup scripts

## Provided Charts

* NFS CSI Driver
* ownCloud
* XWiki