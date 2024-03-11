//
//  NavigationStep.swift
//  NavigationCoordinator
//
//  Created by Alex Nagy on 13.02.2024.
//

import Foundation

struct NavigationStep {
    var destination: Destination?
    var type: NavigationType
    
    /// Pushes a view onto the coordinator navigation stack
    /// - Parameter destination: the destination of the step
    init(push destination: Destination?) {
        self.destination = destination
        self.type = .link
    }
    
    /// Presents a sheet onto the coordinator navigation stack
    /// - Parameters:
    ///   - destination: the destination of the step
    init(present destination: Destination?) {
        self.destination = destination
        self.type = .sheet
    }
    
    /// Presents a full screen cover onto the coordinator navigation stack
    /// - Parameter destination: the destination of the step
    init(cover destination: Destination?) {
        self.destination = destination
        self.type = .fullScreenCover
    }
}
