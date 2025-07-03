//
//  LoginView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

public struct LoginView: View {
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 104) {
            LoginHeaderView()
            
            CredentialFieldsSection {
                CredentialField(title: "아이디")
                CredentialField(title: "비밀번호")
            }
            
            LoginFooterView()
                .padding(.horizontal, 48)
        }
        .padding(.horizontal, 19)
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

                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .foregroundStyle(Color.gray01)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

/// 아이디, 비밀번호 입력 섹션
fileprivate struct CredentialFieldsSection<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(spacing: 47) {
            content
            Button(action: {}) {
                Text("로그인하기")
                    .font(.MainTextMedium16)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 46)
                    .background(Color.green01)
                    .cornerRadius(20)
            }
        }
    }
}
    
fileprivate struct CredentialField: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.MainTextRegular13)
                .foregroundStyle(Color.black01)
                .padding(.bottom, 2)
            
            Divider()
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
    LoginView()
}
