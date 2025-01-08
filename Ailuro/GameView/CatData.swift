//
//  CatData.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/30/24.
//

import Foundation
import SwiftData

//private let litter = [
//    "MIT-10s",
//    "CatGPT",
//    "Kitt-E",
//    "Boss",
//    "Meowfficial",
//    "Purrson"
//]

@Model
class CatData: Identifiable { //since we are listing this data out
    var id: String
    var name: String
//    var index: Int
    
    
    init(name: String){ //constructor based off name
        self.id = UUID().uuidString //like hashcode
        self.name = name
//        self.index = litter.firstIndex(of: name) ?? 0
    }
}
