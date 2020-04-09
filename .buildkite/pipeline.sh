#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

if [ ! -z "$(git diff --name-only upstream/master master)" ]; then
    cat .buildkite/upstream.yml
fi