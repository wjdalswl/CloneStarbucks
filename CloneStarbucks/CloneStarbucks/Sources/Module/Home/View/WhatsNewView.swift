//
//  WhatsNewView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct WhatsNewView: View {
    // MARK: - Properties
    
    private let items: [AdModel]
    
    // MARK: - Init
    
    /// WhatsNewView
    /// - Parameter items: [AdModel]
    init(items: [AdModel]) {
        self.items = items
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("What’s New")
                .font(.MainTextBold24)
                .foregroundStyle(Color.black03)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(items) { item in
                        SquareImageCard(
                            imageName: item.imageName,
                            title: item.title,
                            content: item.content
                        )
                        .frame(width: 240)
                    }
                }
                .frame(height: 249)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    WhatsNewView(items: AdMockData.mockAdList)
}
