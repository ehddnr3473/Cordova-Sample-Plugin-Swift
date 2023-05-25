var exec = require('cordova/exec');

exports.greet = function(success, error) {
    exec(success, error, "CordovaSamplePluginSwift", "greet");
};

exports.presentModalView = function(success, error) {
    exec(success, error, "CordovaSamplePluginSwift", "presentModalView");
};