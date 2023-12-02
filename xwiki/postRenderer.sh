#!/bin/bash

manifest="$(cat -)"
manifest="$(sed 's/command: .*//g' <<< "${manifest}")"

echo "${manifest}"