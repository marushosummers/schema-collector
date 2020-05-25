#!/bin/sh

set -e

echo "Upload Github Repository..."

cd repo
cp -r ../output/* $SAVE_PATH
git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_NAME"
git add .
git commit -m "Update schemaspy by schema-collector"
git push origin $BRANCH

echo "Done Upload Github Repository"