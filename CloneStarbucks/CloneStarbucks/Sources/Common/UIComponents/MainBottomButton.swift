//
//  MainBottomButton.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct MainBottomButton: View {
    // MARK: - Properties
    
    private let type: MainBottomButtonType
    private let action: () -> Void
    
    // MARK: - Init
    
    /// MainBottomButton
    /// - Parameters:
    ///   - type: MainBottomButtonType
    ///   - action: 버튼 클릭시 실행할 액션
    init(
        type: MainBottomButtonType,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(type.title)
                .font(.MainTextMedium16)
                .foregroundStyle(type.textColor)
                .frame(maxWidth: .infinity)
                .frame(height: type.height)
                .background {
                    RoundedRectangle(cornerRadius: type.cornerRadius)
                        .fill(type.backgroundColor)
                }
        }
    }
}

#Preview {
    MainBottomButton(
        type: .create(isDisabled: true),
        action: { print("생성하기 클릭됨") }
    )
    .disabled(true)
    
    MainBottomButton(
        type: .viewAd,
        action: { print("자세히보기 클릭됨") }
    )
    
    MainBottomButton(
        type: .order(isDisabled: false),
        action: { print("주문하기 클릭됨") }
    )
}
