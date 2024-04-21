#!/bin/bash

if [[ -z "${1}" ]]; then
  echo "Must supply a name"
  exit 1
fi

echo "Creating certificate for $1"