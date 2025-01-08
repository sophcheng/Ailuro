//
//  FootData.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import Foundation
import SwiftData

@Model
class FootData {
    var id: String
    var isHearted: Bool
    
    init() {
        self.id = UUID().uuidString
        self.isHearted = false
    }
}
