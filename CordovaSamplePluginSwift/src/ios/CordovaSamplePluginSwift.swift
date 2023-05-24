//
//  CordovaSamplePluginSwift.swift
//  
//
//  Created by 김동욱 on 2023/05/25.
//

@objc class CordovaSamplePluginSwift: CDVPlugin {
    @objc(greet:)
    func greet(command: CDVInvokedUrlCommand) {
        print("Received successfully.")
        let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Hi, I'm a Yeolmok on iOS platform")
        self.commandDelegate.send(result, callbackId: command.callbackId)
    }
}
