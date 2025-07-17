//
//  HomeView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    
    @State private var viewModel: HomeViewModel
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    
    // MARK: - Init
    
    /// HomeView
    /// - Parameter viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            HomeHeaderView()
            
            VStack(spacing: 20) {
                bannerImage(.banner1Bear)
                
                RecommendedMenuView(
                    type: .coffee,
                    nickname: viewModel.nickname(from: signupInfo),
                    title: "님을 위한 추천메뉴",
                    recommendedItems: viewModel.recommendedCoffees
                )
                
                bannerGroup(viewModel.topBanners)
                
                WhatsNewView(items: AdMockData.mockAdList)
                
                bannerGroup(viewModel.bottomBanners)
                
                RecommendedMenuView(
                    type: .bread,
                    title: "하루가 달콤해지는 디저트",
                    recommendedItems: viewModel.recommendedBreads
                )
                
                bannerGroup(viewModel.finalBanners)
            }
            .padding(.bottom, 83)
            .safeAreaPadding(.horizontal, 10)
        }
        .scrollIndicators(.hidden)
    }
    
    /// bannerImage
    /// - Parameter name: ImageResource
    /// - Returns: 단일 배너 이미지 반환
    @ViewBuilder
    private func bannerImage(_ name: ImageResource) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    /// bannerGroup
    /// - Parameter banners: [ImageResource] (ImageResource 배열)
    /// - Returns: 배너 이미지 배열 VStack(spacing: 20)으로 묶은 뷰 반환
    @ViewBuilder
    private func bannerGroup(_ banners: [ImageResource]) -> some View {
        VStack(spacing: 20) {
            ForEach(banners, id: \.self) { banner in
                bannerImage(banner)
            }
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel())
}
