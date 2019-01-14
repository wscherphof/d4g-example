#!/bin/bash

export DOCKER_USER='example'
export DOCKER_REPO='proxy'

"${DOCKER_BASE}/proxy/build.sh"
