//
//  HomeView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/21/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowArticle = false
    @EnvironmentObject var vm: BPViewModel
    
    var body: some View {
        NavigationStack {
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
                    VStack {
                        HStack {
                            Text(vm.dateFormatter.string(from: bp.date))
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        
                        HStack {
                            Text("\(bp.sysBP) / \(bp.diaBP)")
                                .bold()
                                .font(.title2)
                            Spacer()
                             
                            Image(bp.isTakePill ? "medicine" : "medicineCross")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(15)
                        }
                    }
                }
                .onAppear {
                    vm.getMockBPs()
                }
              
            }
        }
        .environmentObject(vm)
    }
}

#Preview {
    HomeView()
        .environmentObject(BPViewModel())
}
