//
//  BP.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import Foundation

struct BPModel {
    var id = UUID()
    var sysBP: Int
    var diaBP: Int
    var pulse: Int
    var isTakePill: Bool
    var date: Date
}
