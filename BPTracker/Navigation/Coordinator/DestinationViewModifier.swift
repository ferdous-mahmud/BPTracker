//
//  DestinationViewModifier.swift
//  NavigationCoordinatorDemo
//
//  Created by Alex Nagy on 18.02.2024.
//

import SwiftUI

struct DestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationBarBackButtonHidden()
        }
#if !os(macOS)
        .navigationViewStyle(.stack)
#endif
    }
}
