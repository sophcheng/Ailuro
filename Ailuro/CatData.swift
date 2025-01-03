//
//  CatData.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/30/24.
//

import Foundation
import SwiftData

@Model
class CatData: Identifiable { //since we are listing this data out
    var id: String
    var name: String
    
    init(name: String){ //constructor based off name
        self.id = UUID().uuidString //like hashcode
        self.name = name
    }
}
