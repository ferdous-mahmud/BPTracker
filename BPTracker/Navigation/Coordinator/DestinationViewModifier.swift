//
//  DestinationViewModifier.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 11/3/24.
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
