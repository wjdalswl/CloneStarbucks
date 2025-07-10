//
//  AdPopupView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct AdPopupView: View {
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image(.adPopup)
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.top)
        .safeAreaInset(edge: .bottom) {
            AdBottomSection()
        }
    }
}

/// 하단 버튼 세션
fileprivate struct AdBottomSection: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 19) {
            MainBottomButton(
                type: .viewAd,
                action: { print("자세히 보기") }
            )

            Button(action: {
                dismiss()
            }) {
                Text("X 닫기")
                    .font(.MainTextLight14)
                    .foregroundStyle(Color.gray05)
            }
            .padding(.horizontal, 19)
        }
        .safeAreaPadding(.horizontal, 19)
    }
}

#Preview {
    AdPopupView()
}
