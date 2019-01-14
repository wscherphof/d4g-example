#!/bin/bash

export DOCKER_REPO='postgis'

"${DOCKER_BASE}/postgis/run.sh" postgres theroofisonfire example
