#!/bin/bash
brew install jq # easier handling of json data

# get project ARN from
# aws devicefarm list-projects
# get device pool from
# aws devicefarm list-device-pools --arn $PROJECT_ARN

# constants
RUN_NAME=demorun
IPA_NAME=BBCalabashDemo.ipa
CALABASH_NAME=features.zip
zip -r $CALABASH_NAME features

echo $PROJECT_ARN
echo $DEVICE_POOL_ARN
# create the upload request
#aws devicefarm create-upload –-project-arn $PROJECT_ARN -–name $APK_NAME -–type IOS_APP
echo "===== Upload IPA"
APP_UPLOAD="$(aws devicefarm create-upload --project-arn $PROJECT_ARN --name $IPA_NAME --type IOS_APP | jq '.upload')"
echo $APP_UPLOAD
UPLOAD_URL="$(echo $APP_UPLOAD  | jq '.url')"
UPLOAD_URL=${UPLOAD_URL//\"}

APP_ARN="$(echo $APP_UPLOAD | jq '.arn')"
APP_ARN=${APP_ARN//\"}

echo $IPA_NAME
echo $UPLOAD_URL

curl -T $BUDDYBUILD_IPA_PATH $UPLOAD_URL

sleep 30
echo "===== Upload Calabash Features"
CALABASH_UPLOAD="$(aws devicefarm create-upload --project-arn $PROJECT_ARN --name $CALABASH_NAME --type CALABASH_TEST_PACKAGE | jq '.upload')"
echo $CALABASH_UPLOAD

CALABASH_URL="$(echo $CALABASH_UPLOAD | jq '.url')"
CALABASH_URL=${CALABASH_URL//\"}

curl -T $CALABASH_NAME $CALABASH_URL

CALABASH_ARN="$(echo $CALABASH_UPLOAD | jq '.arn')"
CALABASH_ARN=${CALABASH_ARN//\"}
sleep 30

TEST_OBJECT='{"type":"CALABASH","testPackageArn":"'$CALABASH_ARN'"}'
echo $TEST_OBJECT

echo "===== Beginning DeviceFarm Run"
RUN_RESULT="$(aws devicefarm schedule-run --project-arn $PROJECT_ARN --app-arn $APP_ARN --device-pool-arn $DEVICE_POOL_ARN --name $RUN_NAME --test=$TEST_OBJECT | jq '.run')"
RUN_ARN="$(echo $RUN_RESULT | jq '.arn')"
RUN_ARN=${RUN_ARN//\"}

echo $RUN_RESULT
echo $RUN_ARN
echo "===== Build Sent to DeviceFarm"
echo "NOTE: All test results will only be available on DeviceFarm, not buddybuild."
