#!/usr/bin/env bash

set -xe

for p in */; do
    if [ ! -f "${p}/build.bash" ]; then
        echo "No build.bash in ${p} !"
        exit 1
    fi
    PUSH_MANIFEST="${PUSH_MANIFEST:-false}" TAGS="$(echo "${TAGS:-latest}" | tr '[:upper:]' '[:lower:]')" bash "${p}/build.bash"
done
