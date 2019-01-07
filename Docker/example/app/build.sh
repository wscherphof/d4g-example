#!/bin/bash

export DOCKER_USER='example'
export DOCKER_REPO='app'

# Below this comment is a workaround to skip the Elm build step.
# Since for this example, we don't do Elm, but just serve static files instead.
# Normally, the rest of this script would look as simple as something like:
# "${DOCKER_BASE}/elm/build.sh" "$(pwd)/../../../app"

IMAGE="${DOCKER_REGISTRY}${DOCKER_USER}/${DOCKER_REPO}:${DOCKER_TAG}"

echo; echo "Building $IMAGE"

pushd "$(pwd)/../../../app"

echo 'FROM merkatorgis/elm-serve' > ./Dockerfile
docker image build -t "${IMAGE}" .
rm ./Dockerfile

popd
