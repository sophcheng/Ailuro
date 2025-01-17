//
//  CatData.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/30/24.
//

import Foundation
import SwiftData

private let litter = [
    "MIT-10s",
    "CatGPT",
    "Kitt-E",
    "Boss",
    "Meowfficial",
    "Purrson"
]

var litterStat: [String: [Int]] {
    return [
        "MIT-10s": [Int.random(in: 8..<10), Int.random(in: 8..<10)],
        "CatGPT": [Int.random(in: 5..<8), Int.random(in: 5..<10)],
        "Kitt-E": [Int.random(in: 0..<5), Int.random(in: 5..<10)],
        "Boss": [Int.random(in: 8..<10), 5],
        "Meowfficial": [Int.random(in: 5..<8), 4],
        "Purrson": [Int.random(in: 1..<10), 3]
    ]
}


@Model
class CatData: Identifiable {
    var id: String
    var name: String
//    var isPopped: Bool
    
    init(){
        self.id = ""
        self.name = "null"
//        self.isPopped = false
    }
    
    init(name: String){
        self.id = UUID().uuidString
        self.name = name
//        self.isPopped = false
    }
    
    func getIndex() -> Int{
        return litter.firstIndex(of: name) ?? 0
    }
    
    func isAI() -> Bool{
        return getIndex() < 3 && getIndex() < 6
    }
    
    func getWorkCost() -> Int{
        return litterStat[self.name]?[0] ?? 0
    }
    
    func getEnvCost() -> Int{
        return litterStat[self.name]?[1] ?? 0
    }
}
