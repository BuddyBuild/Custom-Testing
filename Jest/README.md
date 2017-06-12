## Jest ##

### Setup Guidelines ###
_buddybuild_postbuild.sh_
```
# Jest won't create our folder structure for us, so lets create it first
mkdir buddybuild_artifacts && mkdir buddybuild_artifacts/Jest

jest --outputFile=buddybuild_artifacts/Jest/jest.json --json
# Some users might want to just run
# npm test instead, depending on how they have everything set up
```
_Configuration Files_

```

```
### Integration with Custom Test Reporting ###
Supported through the native jest output format
