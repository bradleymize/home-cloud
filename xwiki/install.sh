#!/bin/bash

helm upgrade -n xwiki -i xwiki xwiki-helm/xwiki --post-renderer ./postRenderer.sh -f values.yaml --create-namespace
