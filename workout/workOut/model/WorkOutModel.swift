//
//  WorkOutModel.swift
//  workout
//
//  Created by vano Kvakhadze on 11.07.24.
//

import Foundation

struct Exercise: Decodable{
    let bodyPart: String
    let equipment: String
    let gifUrl: String
    let id : String
    let name: String
    let target: String
    let secondaryMuscles: [String]
    let instructions: [String]
     
}

struct bodyPart{
    let musclesName: [String]
}
