#!/bin/bash

set -e

echo "Upload Github Repository..."

cd repo
cp -R /output/* ${SAVE_PATH}schemaspy
cp -R /dump/* ${SAVE_PATH}dump
cp -R /diff/* ${SAVE_PATH}diff
git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_NAME"
git add .
git commit -m "Update schemaspy by schema-collector"
git push origin $BRANCH

echo "Done Upload Github Repository"