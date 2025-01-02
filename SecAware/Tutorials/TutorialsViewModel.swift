//
//  TutorialsViewModel.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

struct TutorialsViewModel {
    
    let list: [Tutorial] = [
        EntitlementsTutorial(),
        PasscodeTutorial(),
        TwoFactorAuthTutorial(),
        ManageAppsTutorial(),
        WifiTutorial()
    ]
    
}
