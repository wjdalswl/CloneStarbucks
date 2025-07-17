//
//  CustomTextField.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    
    @Binding private var text: String
    private let placeholder: String
    private let type: CustomTextFieldType
    
    @FocusState private var isFocused: Bool
    
    // MARK: - Init
    
    /// CustomTextField
    /// - Parameters:
    ///   - text: 입력중인 text
    ///   - placeholder: placeholder 값
    ///   - type: CustomTextFieldType 중 입력, 필수 x (기본: .login)
    init(
        text: Binding<String>,
        placeholder: String,
        type: CustomTextFieldType = .login
    ) {
        self._text = text
        self.placeholder = placeholder
        self.type = type
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: type.underlineSpacing) {
            TextField(
                "",
                text: $text,
                prompt:
                    Text(placeholder)
                    .font(type.font)
                    .foregroundStyle(Color.gray02)
            )
            .font(type.font)
            .foregroundStyle(Color.black01)
            .tint(type.focusColor)
            .focused($isFocused)
            
            Divider()
                .background(isFocused ? type.focusColor : type.unfocusedColor)
                .animation(.easeInOut(duration: 0.2), value: isFocused)
            
        }
    }
}

#Preview {
    @Previewable
    @State var inputText: String = ""
    
    CustomTextField(text: $inputText, placeholder: "아이디")
    CustomTextField(text: $inputText, placeholder: "아이디", type: .signup)
}
