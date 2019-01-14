#!/bin/bash

export DOCKER_REPO='app'

"${DOCKER_BASE}/serve/build.sh" "$(pwd)/../../app"
