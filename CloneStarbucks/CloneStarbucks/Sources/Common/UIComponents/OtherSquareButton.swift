//
//  OtherSquareButton.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct OtherSquareButton: View {
    // MARK: - Properties
    
    private let type: OtherSquareButtonItem
    private let action: () -> Void
    
    // MARK: - Init
    
    /// OtherSquareButton
    /// - Parameters:
    ///   - type: OtherSquareButtonItem
    ///   - action:  버튼 클릭시 실행할 액션
    init(
        type: OtherSquareButtonItem,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                type.icon
                
                Text(type.title)
                    .font(.MainTextSemiBold16)
                    .foregroundStyle(Color.black03)
            }
            
            .padding(.vertical, 17)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .btn1()
        }
    }
}

#Preview {
    OtherSquareButton(
        type: .eReceipt,
        action: { print("클릭됨") }
    )
    .frame(width: 102, height: 108)
    
}
