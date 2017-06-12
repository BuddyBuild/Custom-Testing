#!/usr/bin/env bash

echo '=== PREBUILD FOLDER STRUCTURE'
ls -1

echo '=== ../ FOLDER STRUCTURE'
cd ../
ls -1
echo '=== ../ FOLDER PATH'
pwd
npm test -- --verbose
