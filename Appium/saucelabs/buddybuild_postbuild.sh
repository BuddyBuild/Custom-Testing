# constants
ZIPPED_APP=/tmp/sandbox/workspace/zippedapp.zip

# log some standard information
echo $BUDDYBUILD_IPA_PATH

echo "=== Beginning upload of app to saucelabs ==="
# saucelabs expects the app to be zipped
zip -r -X $ZIPPED_APP $BUDDYBUILD_IPA_PATH 
curl -u $SAUCELABS_USERNAME:$SAUCELABS_KEY -X POST -H "Content-Type: application/octet-stream" https://saucelabs.com/rest/v1/storage/$SAUCELABS_USERNAME/app_name?overwrite=true --data-binary @$ZIPPED_APP
echo "=== Completed upload of app to saucelabs ==="

echo "=== Started test run ==="

echo "=== Test Suite complete ==="
