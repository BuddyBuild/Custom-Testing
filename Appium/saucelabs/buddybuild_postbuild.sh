# constants
ZIPPED_APP=/tmp/sandbox/workspace/zippedapp.zip

# set up the custom reporting folders
mkdir /tmp/sandbox/workspace/buddybuild_artifacts
mkdir /tmp/sandbox/workspace/buddybuild_artifacts/Appium

# log some standard information
APP_PATH="/tmp/sandbox/$BUDDYBUILD_APP_ID/bbbuild/Build/Products/Debug-iphonesimulator/m2048.app"
echo $APP_PATH
echo "=== Beginning upload of app to saucelabs ==="
# saucelabs expects the app to be zipped
zip -r $ZIPPED_APP $APP_PATH
curl -u $SAUCE_USERNAME:$SAUCE_ACCESS_KEY -X POST -H "Content-Type: application/octet-stream" https://saucelabs.com/rest/v1/storage/$SAUCE_USERNAME/test_app.zip?overwrite=true --data-binary @$ZIPPED_APP

echo "=== Completed upload of app to saucelabs ==="
brew install maven
cd appiumtest
echo "=== Started test run ==="
mvn test
echo "=== Test Suite complete ==="
mv target/surefire-reports/*.xml /tmp/sandbox/workspace/buddybuild_artifacts/Appium
