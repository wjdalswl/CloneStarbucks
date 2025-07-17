//
//  CustomTabBarView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct CustomTabBarView: View {
    // MARK: - Properties
    
    @State private var selectedTab: TabBarItem = .home

    // MARK: - Init
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(viewModel: HomeViewModel())
                .tag(TabBarItem.home)

            ContentView()
                .tag(TabBarItem.pay)

            ContentView()
                .tag(TabBarItem.order)

            ContentView()
                .tag(TabBarItem.shop)

            OtherView(viewModel: OtherViewModel())
                .tag(TabBarItem.other)
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    CustomTabBarView()
}
