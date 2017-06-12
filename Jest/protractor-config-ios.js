exports.config = {
  seleniumAddress: 'http://localhost:4723/wd/hub',

  specs: [
    'basic/*_spec.js'
  ],

  // Reference: https://github.com/appium/sample-code/blob/master/sample-code/examples/node/helpers/caps.js
  capabilities: {
    browserName: 'safari',
    platformName: 'iOS',
    platformVersion: '7.1',
    deviceName: 'iPhone Simulator',
  },

  baseUrl: 'http://localhost:8000'
};
