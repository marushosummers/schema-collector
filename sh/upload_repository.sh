#!/bin/bash

set -e

echo "Upload Github Repository..."

cd repo
if [ -n "$(ls /output)" ]; then
    if [ ! -d ${SAVE_PATH}schemaspy ] ;then
        echo "make dir on ${SAVE_PATH}schemaspy"
        mkdir ${SAVE_PATH}schemaspy
    fi
    cp -R /output/* ${SAVE_PATH}schemaspy
fi

if [ -n "$(ls /dump)" ]; then
    if [ ! -d ${SAVE_PATH}dump ] ;then
        echo "make dir on ${SAVE_PATH}dump"
        mkdir ${SAVE_PATH}dump
    fi
    cp -R /dump/* ${SAVE_PATH}dump
fi

if [ -n "$(ls /diff)" ]; then
    if [ ! -d ${SAVE_PATH}diff ] ;then
        echo "make dir on ${SAVE_PATH}diff"
        mkdir ${SAVE_PATH}diff
    fi
    cp -R /diff/* ${SAVE_PATH}diff
fi
git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_NAME"
git add .
git commit -m "Update schemaspy by schema-collector"
git push origin $BRANCH

echo "Done Upload Github Repository"