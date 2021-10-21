#!/usr/bin/env bash

hash=$(git rev-parse HEAD)

cd build

# Since we're technically in a new local repo, we have to configure at this
# point in time instead of ahead of time.
git config user.name 'Build Bot'
git config user.email '<>'
git add .
git commit -m "Build $hash"
git push origin builds
