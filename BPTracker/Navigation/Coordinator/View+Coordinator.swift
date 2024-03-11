//
//  View+Coordinator.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 11/3/24.
//

import SwiftUI

extension View {
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    /// Presents a view when a binding to a Boolean value that you
    /// provide is true.
    /// - Parameters:
    ///   - type: The type of navigation.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the sheet that you create in the modifier's.
    ///     `destination` closure.
    ///   - onDismiss: The closure to execute when dismissing the `destination`.
    ///   - destination: A closure that returns the content of the `destination`.
    func navigation<Destination: View>(_ type: NavigationType,
                                       isPresented: Binding<Bool>,
                                       onDismiss: (() -> Void)? = nil,
                                       @ViewBuilder destination: @escaping () -> Destination) -> some View {
        switch type {
        case .link:
            self.modifier(DestinationLinkModifier(
                isPresented: isPresented,
                onDismiss: onDismiss,
                destination: destination)
            )
        case .sheet:
            self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
                destination()
            }
        case .fullScreenCover:
#if !os(macOS)
            self.fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
                destination()
            }
#else
            self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
                destination()
            }
#endif
        }
    }
    
    @ViewBuilder
    /// Sets the view a destination
    func destination(navigationBarBackButtonHidden: Bool = false) -> some View {
        NavigationCoordinator {
            self
                .if(!navigationBarBackButtonHidden, transform: { view in
                    view
                        .navigationBarBackButton(isShown: true)
                })
        }
        .modifier(DestinationViewModifier())
    }
}
