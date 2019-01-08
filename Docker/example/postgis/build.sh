#!/bin/bash

export DOCKER_USER='example'
export DOCKER_REPO='postgis'

"${DOCKER_BASE}/postgis/build.sh"
