//
//  BPViewModel.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import SwiftUI

final class BPViewModel: ObservableObject {
    
    @Published var bpList = [BPModel]()
    
    /// Return a mock data for implementing view
    func getMockBPs() {
        bpList = [
            BPModel(sysBP: 110, diaBP: 50, pulse: 90, isTakePill: false,
                    date: dateFormatter.date(from: "Feb  1  09:30 AM") ?? Date.now),
            BPModel(sysBP: 132, diaBP: 72, pulse: 82, isTakePill: true,
                    date: dateFormatter.date(from: "Feb  2  03:15 PM") ?? Date.now),
            BPModel(sysBP: 101, diaBP: 69, pulse: 108, isTakePill: false,
                    date: dateFormatter.date(from: "Feb  3  07:45 PM") ?? Date.now),
            BPModel(sysBP: 123, diaBP: 91, pulse: 93, isTakePill: true,
                    date: dateFormatter.date(from: "Feb  4  11:20 AM") ?? Date.now)
        ]
    }
    
    /// Add new BP entry
    func addNewBP(newBP: BPModel) -> Bool {
        
        bpList.append(newBP)
        
        return true
    }
    
    /// Evaluate BP numbers and return result string
    func getBloodPressureConditionString(systolic: Int, diastolic: Int) -> BPCondition {
        
        guard systolic >= diastolic else {
            //            return "Invalid input: Systolic pressure cannot be less than diastolic pressure."
            return BPCondition(name: "Invalid input!", color: Color.red)
        }
        guard systolic <=  300, diastolic <=  300 else {
            //            return "Invalid input: Blood pressure values are too high."
            return BPCondition(name: "Invalid input!", color: Color.red)
        }
        guard systolic >=  40, diastolic >=  40 else {
            //            return "Invalid input: Blood pressure values are too low."
            return BPCondition(name: "Invalid input!", color: Color.red)
        }
        
        if systolic <=  90 && diastolic <=  60 {
            return BPCondition(name: "Hypotension", color: Color.yellow)
        } else if systolic <=  130 && diastolic <=  85 {
            return BPCondition(name: "Normal", color: Color.green)
        } else if systolic <=  140 && diastolic <=  90 {
            return BPCondition(name: "High Normal", color: Color.cyan)
        } else if systolic <=  160 && diastolic <=  100 {
            return BPCondition(name: "Grade 1 Hypertension", color: Color.orange)
        } else if systolic <=  180 && diastolic <=  110 {
            return BPCondition(name: "Grade2 Hypertension", color: Color.red.opacity(0.5))
        } else if systolic >  180 && diastolic >  110 {
            return BPCondition(name: "Grade 3 Hypertension", color: Color.red.opacity(0.7))
        } else if systolic >=  200 && diastolic >=  130 {
            return BPCondition(name: "Hypertension Stage 4", color: Color.red)
        } else {
            //            return BPCondition(name: "Invalid input: Blood pressure values are out of range", color: Color.yellow)
            return BPCondition(name: "Invalid input!", color: Color.red)
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d h:mm a"
        return formatter
    }()
}
