//
//  CustomImageTextButton.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct CustomImageTextButton: View {
    // MARK: - Properties
    
    private let type: CustomImageTextButtonItem
    private let action: () -> Void
    
    // MARK: - Init
    
    /// CustomImageTextButton
    /// - Parameters:
    ///   - type: PayMenuItem 이나 CustomerSupportMenuItem 중 선택 (CustomImageTextButtonItem)
    ///   - action:  버튼 클릭시 실행할 액션
    init(
        type: CustomImageTextButtonItem,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                type.icon
                
                Text(type.title)
                    .foregroundStyle(Color.black02)
                    .font(.MainTextSemiBold16)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CustomImageTextButton(
        type: PayMenuItem.couponHistory,
        action: { print("클릭됨") }
    )
}
