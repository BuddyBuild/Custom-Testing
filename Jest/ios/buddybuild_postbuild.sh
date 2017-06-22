#!/usr/bin/env bash
echo '=== CUSTOM TEST PATH ==='
echo $BUDDYBUILD_CUSTOM_TEST_RESULTS;
echo '=== FOLDER LISTING POST BUILD'
ls -1

echo '=== Navigate to tests folder'
cd ../
mkdir buddybuild_artifacts && mkdir buddybuild_artifacts/Jest
npm run ci_test
