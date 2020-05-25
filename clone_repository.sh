#!/bin/sh

set -e

echo "Clone Github Repository..."

git clone -b $BRANCH $GITHUB_URL repo