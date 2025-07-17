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
    let onLoginSuccess: () -> Void
    
    @EnvironmentObject var container: DIContainer
    
    // MARK: - Init
    
    /// LoginView
    /// - Parameter viewModel: LoginViewModel
    /// - Parameter onLoginSuccess: 로그인 성공 여부 -> 스플래쉬에서 전환 시 사용
    init(viewModel: LoginViewModel,
         onLoginSuccess: @escaping () -> Void
    ) {
        _viewModel = State(initialValue: viewModel)
        self.onLoginSuccess = onLoginSuccess
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destination) {
            VStack {
                Spacer()
                LoginHeaderView()
                Spacer()
                CredentialFieldsSection(
                    viewModel: viewModel,
                    onLoginSuccess: onLoginSuccess
                )
                Spacer()
                LoginFooterView()
                    .padding(.horizontal, 48)
                Spacer()
            }
            .padding(.horizontal, 19)
            .task {
                UIApplication.shared.hideKeyboard()
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .signup:
                    SignupView(viewModel: SignupViewModel())
                    .environmentObject(container)
                default:
                    EmptyView()
                }
            }
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
    let onLoginSuccess: () -> Void
    
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    @State private var alertMessage: String = ""
    @State private var showLoginFailureAlert: Bool = false
    
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
                type: .login(isDisabled: viewModel.isLoginDisabled),
                action: {
                    switch viewModel.verifyUser(from: signupInfo) {
                    case .success:
                        onLoginSuccess()
                    case .failure(let message):
                        alertMessage = message
                        showLoginFailureAlert = true
                    }
                }
            )
            .disabled(viewModel.isLoginDisabled)
            
        }
        .alert("로그인 실패", isPresented: $showLoginFailureAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }
}

/// 하단 소셜 로그인 섹션
fileprivate struct LoginFooterView: View {
    @EnvironmentObject var container: DIContainer

    var body: some View {
        VStack(spacing: 19) {
            Button(action: {
                container.navigationRouter.push(to: .signup)
            }) {
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
    LoginView(
        viewModel: LoginViewModel(),
        onLoginSuccess: {}
    )
    .environmentObject(DIContainer())
}
