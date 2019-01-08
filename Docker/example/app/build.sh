#!/bin/bash

export DOCKER_USER='example'
export DOCKER_REPO='app'

"${DOCKER_BASE}/serve/build.sh" "$(pwd)/../../../app"
