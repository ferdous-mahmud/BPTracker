//
//  HomeView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/21/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowArticle = false
    
    var body: some View {
        VStack {
            BPArticleTile()
                .onTapGesture {
                    haptic(.success)
                    isShowArticle.toggle()
                }
                .fullScreenCover(isPresented: $isShowArticle) {
                    BPArticleView()
                }
            
            HStack {
                Text("History")
                    .bold()
                    .font(.title3)
                Spacer()
            }
            .padding(.leading)
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
