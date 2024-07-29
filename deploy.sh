#!/bin/bash

set -e

TAG_NAME=release_x.x.x
git add .
git commit -m "Release $TAG_NAME"
git pull --rebase
git push
git tag $TAG_NAME
git push origin $TAG_NAME
