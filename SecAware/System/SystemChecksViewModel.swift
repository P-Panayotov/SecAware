//
//  SystemChecksVideModel.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct SystemChecksViewModel {
    let checks: [SystemCheckProtocol] = [
        AppVersionCheck(),
        OsSystemCheck(),
        PasscodeCheck(),
        JailbreakCheck()
    ]
}
