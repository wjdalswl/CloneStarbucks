//
//  CustomTabBar.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct CustomTabBar: View {
    // MARK: - Properties
    
    @Binding private var selectedTab: TabBarItem
    
    // MARK: - Init
    
    /// CustomTabBar
    /// - Parameter selectedTab: 선택된 탭
    init(selectedTab: Binding<TabBarItem>) {
        self._selectedTab = selectedTab
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(TabBarItem.allCases) { tab in
                TabButton(
                    item: tab,
                    isSelected: selectedTab == tab,
                    action: {
                        withAnimation {
                            selectedTab = tab
                        }
                    }
                )
                if tab != TabBarItem.allCases.last {
                    Spacer()
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 53)
        .frame(height: 83)
        .background(Color.white)
    }
}

/// 탭 버튼
fileprivate struct TabButton: View {
    let item: TabBarItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                item.icon
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? item.selectedIconColor : item.unselectedIconColor)
                
                Text(item.title)
                    .font(.MainTextMedium13)
                    .foregroundColor(isSelected ? item.selectedTextColor : item.unselectedTextColor)
            }
        }
    }
}

#Preview {
    @Previewable
    @State var selectedTab: TabBarItem = .home
    
    CustomTabBar(selectedTab: $selectedTab)
}
