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
            
            Text("History")
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
