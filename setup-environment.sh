#!/bin/bash

. setupScripts/util/log.sh
. setupScripts/util/util.sh

# TODO: Install minikube
# TODO: Add minikube to /etc/hosts
# TODO: Open up port 443
# TODO: Create NFS share for persistence outside of minikube cluster
# TODO: Create certificate for client certificate validation for nginx

function install_prerequisites() {
  log "Updating packages"
  sudo apt-get update &>/dev/null

  installProgram "jq" "  "
}

function get_config() {
  readJson "config.json"
}

function main() {
  banner "Setting up home cloud"

  log "Installing prerequisites"
  if ! install_prerequisites; then
    logError "Error installing prerequisites"
    exit 1
  fi

  log "Reading configuration"
  JSON_CONFIG="$(get_config)"

  banner "Installing nfs"
  banner "Installing client certificates"
  banner "Installing docker"
  banner "Installing kubernetes"
  banner "Installing helm"
  banner "Installing minikube"
}

main