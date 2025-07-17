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
    @EnvironmentObject private var container: DIContainer
    @EnvironmentObject private var appStateViewModel: AppStateViewModel
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destination) {
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
            .navigationDestination(for: NavigationDestination.self) { destination in
                NavigationRoutingView(destination: destination)
            }
        }
        .environmentObject(container)
        .environmentObject(appStateViewModel)
    }
}

#Preview {
    CustomTabBarView()
        .environmentObject(DIContainer())
        .environmentObject(AppStateViewModel())
}
