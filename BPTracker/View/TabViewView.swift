//
//  ContentView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/20/24.
//

import SwiftUI

struct TabViewView: View {
    @State var isShowNewBPSheet = false
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                AnalyticsView()
                    .tabItem {
                        Label("Analytics", systemImage: "chart.line.uptrend.xyaxis.circle")
                    }
            }
            .onAppear {
                UITabBar.appearance().backgroundColor = UIColor(named: "TabBarBackgroundColor")!
            }
            
            // MARK: Plus icon to add new BP
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color(UIColor(named: "TabBarBackgroundColor")!))
                        .frame(width: 100, height: 65)
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color("AccentColor"))
                        .font(.system(size: 45))
                        .onTapGesture {
                            isShowNewBPSheet.toggle()
                            haptic(.success)
                        }
                        .sheet(isPresented: $isShowNewBPSheet) {
                            AddNewBPView()
                        }
                }
            }
        }
    }
}

#Preview {
    TabViewView()
}
