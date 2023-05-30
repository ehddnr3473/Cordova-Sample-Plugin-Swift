cordova.define("com.yeolmok.samplepluginswift.CordovaSamplePluginSwift", function(require, exports, module) {
    var exec = require('cordova/exec');

    exports.greet = function(success, error) {
        exec(success, error, "CordovaSamplePluginSwift", "greet");
    };

    exports.presentModalView = function(success, error) {
        exec(success, error, "CordovaSamplePluginSwift", "presentModalView");
    };

    exports.presentKeyPadView = function(success, error) {
        exec(success, error, "CordovaSamplePluginSwift", "presentKeyPadView")
    }
});
