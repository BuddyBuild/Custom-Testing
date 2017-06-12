## Cucumber ##

### Setup Guidelines ###
_buddybuild_postbuild.sh_
```
echo password | sudo -S gem install cucumber

npm install -g appium@1.4.16
npm install wd

nohup appium --native-instruments-lib -lt 999999 &
sleep 15 && cucumber --format junit --out buddybuild_artifacts/Cucumber/

status=$?
pkill -f appium
if [ $status -ne 0 ]; then
echo TESTS FAILED
```
_Configuration Files_

```

```
### Integration with Custom Test Reporting ###
Supported by passing in the --out parameter to cucumber
