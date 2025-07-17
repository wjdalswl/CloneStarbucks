//
//  HomeHeaderView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

/// 홈 상단 노랑 토끼뷰
struct HomeHeaderView: View {
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundImageView()
                .offset(y: -65)
            BackgroundImageView()
            
            VStack(alignment: .leading) {
                TitleView()
                DetailLinkView()
                StarProgressRow()
            }
            .padding(.leading, 29)
            .padding(.trailing, 10)
        }
    }
}

fileprivate struct BackgroundImageView: View {
    var body: some View {
        Image(.bannerHeader)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea()
    }
}

fileprivate struct TitleView: View {
    var body: some View {
        Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
            .font(.MainTextBold24)
            .foregroundStyle(Color.black03)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 10)
    }
}

fileprivate struct DetailLinkView: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("내용 보기")
                .font(.MainTextRegular13)
                .foregroundStyle(Color.gray06)
            
            Image(.goLine)
                .resizable()
                .frame(width: 16, height: 16)
        }
        .padding(.trailing, 13)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

fileprivate struct StarProgressRow: View {
    var body: some View {
        HStack(spacing: 36) {
            RewardProgressView(currentStars: 1)
            
            HStack(spacing: 5) {
                Text("1")
                    .font(.MainTextSemiBold38)
                    .foregroundStyle(Color.black03)
                Text("/")
                    .font(.MainTextLight24)
                    .foregroundStyle(Color.gray03)
                Text("12")
                    .font(.MainTextSemiBold38)
                    .foregroundStyle(Color.brown02)
                + Text("★")
                    .font(.MainTextSemiBold14)
                    .foregroundStyle(Color.brown02)
            }
            .padding(.trailing, 29)
        }
    }
}

#Preview {
    HomeHeaderView()
}
