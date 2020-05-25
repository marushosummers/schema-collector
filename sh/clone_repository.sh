#!/bin/bash

set -e

echo "Clone Github Repository..."

git clone -b $BRANCH $GITHUB_URL repo
mkdir output
mkdir dump
mkdir diff