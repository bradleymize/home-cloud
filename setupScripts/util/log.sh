#!/bin/bash

COLOR_DEFAULT="\033[39m"
COLOR_BLACK="\033[30m"
COLOR_DARK_RED="\033[31m"
COLOR_DARK_GREEN="\033[32m"
COLOR_DARK_YELLOW="\033[33m"
COLOR_DARK_BLUE="\033[34m"
COLOR_DARK_MAGENTA="\033[35m"
COLOR_DARK_CYAN="\033[36m"
COLOR_LIGHT_GRAY="\033[37m"
COLOR_DARK_GRAY="\033[90m"
COLOR_RED="\033[91m"
COLOR_GREEN="\033[92m"
COLOR_ORANGE="\033[93m"
COLOR_BLUE="\033[94m"
COLOR_MAGENTA="\033[95m"
COLOR_CYAN="\033[96m"
COLOR_WHITE="\033[97m"

COLOR_RESET="\033[0m"

function __log() {
  local color="${1}"
  local message="${2}"

  echo -e "${color}${message}${COLOR_RESET}" >&2
}
function logJson() {
  local json="${1}"
  echo -e "${COLOR_MAGENTA}   JSON:${COLOR_RESET}" >&2
  jq '.' <<< "${json}" >&2
}

function logSuccess() {
  local message="${1}"
  __log "${COLOR_GREEN}" "SUCCESS: ${message}"
}
function bannerSuccess() {
  local message="================================================\n   ${1}\n================================================"
  __log "${COLOR_GREEN}" "${message}"
}

function logError() {
  local message="${1}"
  __log "${COLOR_DARK_RED}" "  ERROR: ${message}"
}
function bannerError() {
  local message="================================================\n   ${1}\n================================================"
  __log "${COLOR_DARK_RED}" "${message}"
}

function logInfo() {
  local message="${1}"
  __log "${COLOR_BLUE}" "   INFO: ${message}"
}
function bannerInfo() {
  local message="================================================\n   ${1}\n================================================"
  __log "${COLOR_BLUE}" "${message}"
}

function logWarning() {
  local message="${1}"
  __log "${COLOR_ORANGE}" "WARNING: ${message}"
}
function bannerWarning() {
  local message="================================================\n   ${1}\n================================================"
  __log "${COLOR_ORANGE}" "${message}"
}

function log() {
  local message="${1}"
  __log "${COLOR_WHITE}" "    LOG: ${message}"
}
function banner() {
  local message="================================================\n   ${1}\n================================================"
  __log "${COLOR_WHITE}" "${message}"
}