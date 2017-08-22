# constants
ZIPPED_APP=/tmp/sandbox/workspace/zippedapp.zip

# log some standard information
APP_PATH="/tmp/sandbox/599b66cad741c700015bbcce/bbbuild/Build/Products/Debug-iphonesimulator/m2048.app"
echo $APP_PATH
echo "=== Beginning upload of app to saucelabs ==="
# saucelabs expects the app to be zipped
zip $ZIPPED_APP $APP_PATH
curl -u $SAUCELABS_USERNAME:$SAUCELABS_KEY -X POST -H "Content-Type: application/octet-stream" https://saucelabs.com/rest/v1/storage/$SAUCELABS_USERNAME/test_app.zip?overwrite=true --data-binary $ZIPPED_APP

echo "=== Completed upload of app to saucelabs ==="
brew install maven
cd appiumtest
echo "=== Started test run ==="

echo "=== Test Suite complete ==="
