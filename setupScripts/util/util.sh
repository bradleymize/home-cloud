#!/bin/bash

function isInstalled() {
  local program="${1}"

  if which "${program}" &>/dev/null; then
    echo "true"
  else
    echo "false"
  fi
}

function readJson() {
  local file="${1}"
  jq -rc '.' "${file}"
}

function installProgram() {
  local program="${1}"
  local logPrefix="${2}"

  logInfo "${logPrefix}Installing ${program}"
  if [[ $(isInstalled "${program}") == "false" ]]; then
    sudo apt-get install -y --no-install-recommends "${program}"
    return $?
  else
    logSuccess "${logPrefix}  ${program} already installed"
    return 0
  fi
}