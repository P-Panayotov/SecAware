//
//  AppVersionCheck.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

class AppVersionCheck: SystemCheckProtocol {
    
    var title: String = "SecAware updates check"
    
    var isSuccess: Bool = Bool.random() // hardcoding this here since I do not have a service to fetch this data. Nice to have in future
    
    var errorMessage: String = "Please update SecAware to the latest version available on App Store"
    
    var successMessage: String = "You are using the lasted version of SecAware app."
    
    func run() async {
        // TODO: When released to App Store we can fetch latest version against currently running one and notify user if there is an update available for them to download
    }
}
