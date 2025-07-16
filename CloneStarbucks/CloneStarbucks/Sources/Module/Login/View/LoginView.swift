//
//  LoginView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    
    @State private var viewModel: LoginViewModel
    
    // MARK: - Init
    
    /// LoginView
    /// - Parameter viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            LoginHeaderView()
            Spacer()
            CredentialFieldsSection(viewModel: viewModel)
            Spacer()
            LoginFooterView()
                .padding(.horizontal, 48)
            Spacer()
        }
        .padding(.horizontal, 19)
        .task {
            UIApplication.shared.hideKeyboard()
        }
    }
}

/// 상단 안내 문구 섹션
fileprivate struct LoginHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Image(.starbucsLogo)
                .resizable()
                .frame(width: 97, height: 95)

            VStack(alignment: .leading, spacing: 19) {
                Text("안녕하세요.\n스타벅스입니다.")
                    .font(.MainTextExtraBold)
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 58)

                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .foregroundStyle(Color.gray01)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

/// 아이디, 비밀번호 입력 섹션
fileprivate struct CredentialFieldsSection: View {
    @Bindable var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 47) {
            CustomTextField(
                text: $viewModel.id,
                placeholder: "아이디"
            )
            CustomTextField(
                text: $viewModel.pwd,
                placeholder: "비밀번호"
            )
            
            MainBottomButton(
                type: .login(
                    isDisabled: viewModel.isLoginDisabled
                ),
                action: { print("로그인하기 클릭됨") }
            )
            .disabled(viewModel.isLoginDisabled)
        }
    }
}

/// 하단 소셜 로그인 섹션
fileprivate struct LoginFooterView: View {
    var body: some View {
        VStack(spacing: 19) {
            Button(action: {}) {
                Text("이메일로 회원가입하기")
                    .font(.MainTextRegular12)
                    .foregroundStyle(Color.gray04)
                    .underline(true, color: Color.gray04)
            }

            SocialLoginButton(type: .kakao)
            SocialLoginButton(type: .apple)
        }
    }
    
    struct SocialLoginButton: View {
        let type: SocialLoginType
        
        var body: some View {
            Button(action: {}) {
                type.image
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
