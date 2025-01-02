//
//  PasscodeCheck.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import LocalAuthentication

class PasscodeCheck: SystemCheckProtocol {
    var title: String = "Device Passcode check"
    
    var isSuccess: Bool = false
    
    var errorMessage: String = "Secure your device with Passcode or Biometrics!"
    
    var successMessage: String = "Your device is secured with Passcode/Biometrics"
    
    func run() async {
        isSuccess = LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
}
