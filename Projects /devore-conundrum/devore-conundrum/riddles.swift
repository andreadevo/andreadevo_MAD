//
//  riddles.swift
//  devore-conundrum
//
//  Created by Andrea on 10/11/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import Foundation

struct Riddle : Codable {
    var riddle : String = ""
    var solution : String = ""
    
    init(newRiddle:String, newSolution:String){
        riddle = newRiddle
        solution = newSolution
    }
}
