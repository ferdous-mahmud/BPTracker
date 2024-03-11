//
//  Destination.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 11/3/24.
//

import SwiftUI

enum Destination: Hashable, View {
    
    // MARK: Tab Items
    case home
    case analytics
    
    // MARK: Tab 1 Sheets
    case bpArticle
    case addNewBp
    
    var body: some View {
        switch self {
        case .home:
            HomeView().destination(navigationBarBackButtonHidden: true)
        case .analytics:
            AnalyticsView().destination(navigationBarBackButtonHidden: true)
        case .bpArticle:
            BPArticleView().destination(navigationBarBackButtonHidden: true)
        case .addNewBp:
            AddNewBPView().destination(navigationBarBackButtonHidden: true)
        }
    }
}
