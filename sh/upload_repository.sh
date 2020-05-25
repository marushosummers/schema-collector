#!/bin/bash

set -e

echo "Upload Github Repository..."

cd repo
if [ -n "$(ls /output)" ]; then
    cp -R /output/* ${SAVE_PATH}schemaspy
fi
if [ -n "$(ls /dump)" ]; then
    cp -R /dump/* ${SAVE_PATH}dump
fi
if [ -n "$(ls /diff)" ]; then
    cp -R /diff/* ${SAVE_PATH}diff
fi
git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_NAME"
git add .
git commit -m "Update schemaspy by schema-collector"
git push origin $BRANCH

echo "Done Upload Github Repository"