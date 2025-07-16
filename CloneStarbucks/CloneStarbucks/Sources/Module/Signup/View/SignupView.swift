//
//  SignupView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct SignupView: View {
    // MARK: - Properties
    
    @State private var viewModel: SignupViewModel
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    
    // MARK: - Init
    
    /// LoginView
    /// - Parameter viewModel: SignupViewModel
    init(viewModel: SignupViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            
            SignupFieldSection(viewModel: viewModel)
            
            Spacer()
                .frame(maxHeight: 428)
        }
        .safeAreaInset(edge: .bottom) {
            SignupBottomSection(
                viewModel: viewModel,
                onSignupComplete: {
                    if let encoded = viewModel.encodeUser() {
                        signupInfo = encoded
                    }
                }
            )
            .safeAreaPadding(.horizontal, 19)
        }
        .task {
            UIApplication.shared.hideKeyboard()
        }
    }
}

/// 텍스트 필드 세션
fileprivate struct SignupFieldSection: View {
    @Bindable var viewModel: SignupViewModel

    var body: some View {
        VStack(spacing: 49) {
            CustomTextField(
                text: $viewModel.nickname,
                placeholder: "닉네임",
                type: .signup
            )
            CustomTextField(
                text: $viewModel.email,
                placeholder: "이메일",
                type: .signup
            )
            CustomTextField(
                text: $viewModel.password,
                placeholder: "비밀번호",
                type: .signup
            )
        }
        .padding(.horizontal, 19)
    }
}

/// 하단 버튼 세션
fileprivate struct SignupBottomSection: View {
    var viewModel: SignupViewModel
    let onSignupComplete: () -> Void
    
    var body: some View {
        MainBottomButton(
            type: .create(isDisabled: viewModel.isCreateDisabled),
            action: onSignupComplete
        )
        .disabled(viewModel.isCreateDisabled)
        .safeAreaPadding(.bottom, 20)
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel())
}
