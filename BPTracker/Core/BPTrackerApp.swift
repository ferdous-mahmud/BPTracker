//
//  BPTrackerApp.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/20/24.
//

import SwiftUI

@main
struct BPTrackerApp: App {
    @StateObject var vm: BPViewModel = BPViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabViewView()
                .environmentObject(vm)
        }
    }
}
