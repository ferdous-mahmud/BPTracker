//
//  Destination.swift
//  NavigationCoordinator
//
//  Created by Alex Nagy on 13.02.2024.
//

import SwiftUI

enum Destination: Hashable, View {
    
    // MARK: Tab Items
    case home
    case settings
    
    // MARK: Tab 1 Pages
    case firstPage
    case secondPage
    
    var body: some View {
        switch self {
        case .home:
            HomeView().destination(navigationBarBackButtonHidden: true)
        case .settings:
            SettingsView().destination(navigationBarBackButtonHidden: true)
        case .firstPage:
            FirstView().destination(navigationBarBackButtonHidden: false)
        case .secondPage:
            SecondView().destination(navigationBarBackButtonHidden: true)
        }
    }
}

//// Starter Destination
////
//// Add new cases for new destination views
//// DO NOT use dependency injection; use `EnvironmentObject`s instead to pass data between views
//
// Example Destination
//
//enum Destination: Hashable, View {
//
//    case apple
//    case banana
//    case carrot
//    case damson
//
//    var body: some View {
//        switch self {
//        case .apple:
//            AppleView().destination() // add the `.destination()` after every view
//        case .banana:
//            BananaView().destination()
//                .presentationBackground(.ultraThinMaterial) // add any `presentation` for sheets after the `.destination()`
//        case .carrot:
//            CarrotView().destination()
//        case .damson:
//            DamsonView().destination()
//        }
//    }
//}
