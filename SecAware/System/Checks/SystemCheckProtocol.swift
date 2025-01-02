//
//  SystemCheck.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

protocol SystemCheckProtocol {
    
    var title: String { get }
    var isSuccess: Bool { get }
    var errorMessage: String { get }
    var successMessage: String { get }
    
    func run() async
}
