//
//  RecommendedMenuView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct RecommendedMenuView<T: Product>: View {
    // MARK: - Properties
    
    private let type: ProductType
    private let nickname: String?
    private let title: String
    private let recommendedItems: [T]
    
    @EnvironmentObject private var container: DIContainer
    
    // MARK: - Init
    
    /// RecommendedMenuView
    /// - Parameters:
    ///   - nickname: 옵셔널, title에 사용자 이름이 필요한 경우 사용자 이름 String 값 전달
    ///   - title: title에 들어갈 String값
    ///   - recommendedItems: [Product 채택한 T]
    init(
        type: ProductType,
        nickname: String? = nil,
        title: String,
        recommendedItems: [T]
    ) {
        self.type = type
        self.nickname = nickname
        self.title = title
        self.recommendedItems = recommendedItems
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            if let nickname, !nickname.isEmpty {
                Text("\(nickname)")
                    .font(.MainTextBold24)
                    .foregroundStyle(Color.brown01)
                + Text(title)
                    .font(.MainTextBold24)
                    .foregroundStyle(Color.black03)
            } else {
                Text(title)
                    .font(.MainTextBold24)
                    .foregroundStyle(Color.black03)
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(recommendedItems) { item in
                        CircleImageCard(
                            imageName: item.imageName,
                            title: item.nameKr
                        )
                        .onTapGesture {
                            container.navigationRouter.push(
                                to: .productDetail(type: type, id: item.id)
                            )
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(height: 160)
        }
    }
}

#Preview {
    Group {
        RecommendedMenuView(
            type: .coffee,
            nickname: "마이",
            title: "님을 위한 추천메뉴",
            recommendedItems: CoffeeMockData.mockCoffeeList
        )

        RecommendedMenuView(
            type: .bread,
            title: "하루가 달콤해지는 디저트",
            recommendedItems: BreadMockData.mockBreadList
        )
    }
    .environmentObject(DIContainer())
}
