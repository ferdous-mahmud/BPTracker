//
//  NavigationRoot.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 11/3/24.
//

import SwiftUI

struct NavigationRoot: View {
    
    @StateObject private var navigation: Navigation
    
    /// Root view for coordinator navigation
    /// - Parameter root: root view
    init(_ root: Destination) {
        _navigation = StateObject(wrappedValue: Navigation(root: root))
    }
    
    var body: some View {
        navigation.stack.first?.destination
            .environmentObject(navigation)
    }
}
