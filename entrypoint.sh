#!/bin/sh
set -eu

git_setup ( ) {
    git config --global user.email "actions@github.com"
    git config --global user.name "Create Tag Action"
    git config --global --add safe.directory /github/workspace
}

echo "Creating tag $INPUT_TAG with message '$INPUT_MESSAGE' as '$GITHUB_ACTOR'"

git_setup

git fetch origin --tags --quiet
git tag -a "${INPUT_TAG}" -m "${INPUT_MESSAGE}" "${GITHUB_SHA}" -f
git push --tags -f
