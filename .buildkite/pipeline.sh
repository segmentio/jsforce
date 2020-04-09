#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" != "master" ] && [ ! -z "$(git diff --name-only upstream/master)" ]; then
    git remote add upstream https://github.com/jsforce/jsforce.git || true
    git fetch upstream
    cat .buildkite/upstream.yml
else
    echo "steps:"
    echo "  - command: exit 0"
fi
