//
//  Tutorial.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct TutorialSection: Identifiable {
    var id: String { title }
    let title: String
    let content: [String]
}

protocol Tutorial {
    var image: Image { get }
    var title: String { get }
    var sections: [TutorialSection] { get }
}
