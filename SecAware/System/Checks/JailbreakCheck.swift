//
//  JailbreakCheck.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import CheckJailBreakDevice

class JailbreakCheck: SystemCheckProtocol, CheckIfDeviceIsJailbroken {
    func sendTheStatusOfJailBreak(value: Bool) {
        isSuccess = !value
    }
    
    var title: String = "Jailbreak check"
    
    var isSuccess: Bool = false
    
    var errorMessage: String = "Your device appears to be Jailbroken."
    
    var successMessage: String = "Your device is not Jailbroken and is protected by Apple's system security and App sandbox."
    
    func run() async {
        checkForJailbrokenDevice(type: .all)
        try? await Task.sleep(for: .seconds(2))
    }
    
    
}
