//
//  DestinationLinkModifier.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 11/3/24.
//

import SwiftUI

struct DestinationLinkModifier<Destination: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var onDismiss: (() -> Void)?
    @ViewBuilder var destination: () -> Destination
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
            Group {
                groupContent(content)
            }
            .onChange(of: isPresented) { _, newValue in
                if !newValue {
                    onDismiss?()
                }
            }
        } else {
            Group {
                groupContent(content)
            }
            .onChange(of: isPresented) { newValue in
                if !newValue {
                    onDismiss?()
                }
            }
        }
    }
    
    @ViewBuilder
    func groupContent(_ content: Content) -> some View {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            content
                .background(
                    NavigationLink(isActive: $isPresented, destination: destination, label: {
                        EmptyView()
                    })
                )
        } else if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            content
                .background(
                    NavigationLink(destination: destination(), isActive: $isPresented, label: {
                        EmptyView()
                    })
                )
        }
    }
}
