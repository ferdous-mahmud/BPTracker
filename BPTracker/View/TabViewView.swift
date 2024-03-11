//
//  ContentView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/20/24.
//

import SwiftUI

struct TabViewView: View {
    @EnvironmentObject private var navigation: Navigation
    @EnvironmentObject var vm: BPViewModel
    
    var body: some View {
        ZStack {
            TabView {
                NavigationRoot(.home)
                    .environmentObject(vm)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                NavigationRoot(.analytics)
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
                            haptic(.success)
                            navigation.push(.addNewBp, type: .sheet)
                        }

                }
            }
        }
    }
}

#Preview {
    TabViewView()
}
