//
//  BPArticleView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import SwiftUI

struct BPArticleView: View {
    @Environment(\.dismiss) var dismiss
    
    let desclimerText = """
    The classification is not a mandate but rather a guidance.
    Always discuss with your doctor before using the limits in the table.
    """
    
    var body: some View {
        VStack {
              
            // MARK: close button
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .bold()
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        haptic(.success)
                        dismiss()
                    }
            }
            
            HStack {
                Text("ESC 2018 (European Heart Journal)")
                    .padding(.horizontal, 30)
                    .bold()
                    .font(.title2)
                Spacer()
            }
            
            HStack {
                Text(desclimerText.replacingOccurrences(of: "\n", with: " "))
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    .bold()
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
            }
            
            Image("BPArticle")
                .resizable()
                .padding()
                .frame(height: 380)
            
            Spacer()
        }
    }
}

#Preview {
    BPArticleView()
}
