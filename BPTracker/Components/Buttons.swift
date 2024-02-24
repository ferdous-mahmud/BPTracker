//
//  Buttons.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var onTap: () -> Void
    var icon: Image?
    var color = Color("AccentColor")
    var textColor = Color.white
    
    var body: some View {
        Button(action: {
            onTap()
            haptic(.success)
        }, label: {
            HStack {
                Spacer()
                if icon != nil {
                    icon!
                    Spacer().frame(width: 8)
                }
                Text(title)
                    .bold()
                    .foregroundColor(textColor)
                Spacer()
            }
        })
        .padding(.all)
        .foregroundColor(Color.black)
        .background(color)
        .cornerRadius(10)
    }
}
