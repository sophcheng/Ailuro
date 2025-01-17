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
    var index: Int
    var isHearted: Bool
    
    init(index: Int) {
        self.id = UUID().uuidString
        self.index = index
        self.isHearted = false
    }
}
