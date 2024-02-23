//
//  HomeView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/21/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowArticle = false
    
    @ObservedObject var vm: BPViewModel = BPViewModel()
    
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
            
            List(vm.bpList, id: \.id) { bp in
                Text("\(bp.diaBP)")
            }
            .onAppear {
                vm.getMockBPs()
            }
          
        }
    }
}

#Preview {
    HomeView()
}
