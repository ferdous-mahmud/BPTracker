//
//  BP.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import Foundation

struct BPModel {
    var id = UUID()
    var sysBP: Int32
    var diaBP: Int32
    var pulse: Int32
    var isTakaPill: Bool
    var date: Date
}
