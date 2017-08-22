# Appium Testing with SauceLabs

This example app demonstrates how you might go about setting up a buddybuild project so that it can deploy your simulator build to SauceLabs and run appium tests against it.

## Environment Variables
First, we need to set up two environment variables in buddybuild
- SAUCE_USERNAME
- SAUCE_ACCESS_KEY

These are your credentials to access Sauce Labs.  These credentials are stored securely, and will be exposed only to the scripts we write later:

# the buddybuild_postbuild.sh script
This script will set up our environment in such a way that we can easily upload your build output, as well as run the Java test case.  While we use java, any framework that supported appium can be used.

The key steps this script performs are
1. zip up the .app folder so that it can be uploaded to saucelabs
2. upload the zip file to saucelabs using your credentials
3. install maven
4. run mvn test, triggering the java test case which will connect to appium in saucelabs, and begin running your test case
5. move the output JUnit test output to the buddybuild_artifacts folder, so that buddybuild can examine the output and expose it for rendering in the build details page.
