//
//  SignupView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct SignupView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel: SignupViewModel
    
    // MARK: - Init
    
    /// LoginView
    /// - Parameter viewModel: SignupViewModel
    init(viewModel: SignupViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
            SignupBottomSection(viewModel: viewModel)
        }
        .safeAreaPadding(.horizontal, 19)
        .task {
            UIApplication.shared.hideKeyboard()
        }
    }
}

/// 텍스트 필드 세션
fileprivate struct SignupFieldSection: View {
    @ObservedObject var viewModel: SignupViewModel

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
    }
}

/// 하단 버튼 세션
fileprivate struct SignupBottomSection: View {
    @ObservedObject var viewModel: SignupViewModel

    var body: some View {
        MainBottomButton(
            type: .create(isDisabled: viewModel.isCreateDisabled),
            action: viewModel.saveUser
        )
        .disabled(viewModel.isCreateDisabled)
        .safeAreaPadding(.bottom, 20)
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel())
}
