## Mocha ##

### Setup Guidelines ###
You have to have ```mocha-junit-reporter``` install either has a dependency in your ```package.json```, or install it as part
of the build script.
_buddybuild_postbuild.sh_
```
#npm install mocha-junit-reporter
MOCHA_FILE=buddybuild_artifacts/Mocha/mocha.xml mocha --opts ./mocha.opts
```
_Configuration Files_
_mocha.opts_
```
--reporter mocha-junit-reporter
```
### Integration with Custom Test Reporting ###
Supported through the JUnit reporter
