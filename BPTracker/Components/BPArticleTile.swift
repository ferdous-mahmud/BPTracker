//
//  BPArticleTile.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/22/24.
//

import SwiftUI

struct BPArticleTile: View {
    var body: some View {
        VStack {
            HStack {
                Text("🩸")
                    .padding(.leading, 30)
                    .padding(.top, 20)
                
                Text("Normal Blood pressure")
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(Color("AccentColor"))
                    .padding(.leading, 10)
                    .padding(.top, 20)
                Spacer()
            }
            
            HStack {
                Text("Read Article")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(10)
                    .padding(.leading, 30)
                    .padding(.bottom, 5)
                
                Spacer()
            }
            Spacer()
            
        }
        .frame(height: 100)
        .background(.thinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    BPArticleTile()
}
