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
    
    @EnvironmentObject var container: DIContainer
    
    // MARK: - Init
    
    /// LoginView
    /// - Parameter viewModel: SignupViewModel
    init(viewModel: SignupViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                type: .backOnly,
                onLeftTap: {
                    container.navigationRouter.pop()
                },
                onRightTap: {}
            )
            
            Spacer()
            
            SignupFieldSection(viewModel: viewModel)
            
            Spacer()
                .frame(maxHeight: 400)
        }
        .safeAreaInset(edge: .bottom) {
            SignupBottomSection(
                viewModel: viewModel
            )
        }
        .padding(.horizontal, 19)
        .task {
            UIApplication.shared.hideKeyboard()
        }
        .navigationBarHidden(true)
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
    }
}

/// 하단 버튼 세션
fileprivate struct SignupBottomSection: View {
    var viewModel: SignupViewModel
    
    @EnvironmentObject var container: DIContainer
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    @State private var showFailureAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        MainBottomButton(
            type: .create(isDisabled: viewModel.isCreateDisabled),
            action: {
                if let encoded = viewModel.encodeUser() {
                    signupInfo = encoded
                    container.navigationRouter.pop()
                } else {
                    alertMessage = "회원 정보 저장에 실패했어요. 다시 시도해주세요."
                    showFailureAlert = true
                }
            }
        )
        .disabled(viewModel.isCreateDisabled)
        .safeAreaPadding(.bottom, 20)
        .alert("회원가입 실패", isPresented: $showFailureAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel())
}
