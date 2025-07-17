//
//  OtherView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct OtherView: View {
    // MARK: - Properties
    
    @State private var viewModel: OtherViewModel
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    @EnvironmentObject var container: DIContainer
    
    // MARK: - Init
    
    /// OtherView
    /// - Parameter viewModel: OtherViewModel
    init(viewModel: OtherViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(
                type: .leftTitleAndLogout(title: "Other"),
                onLeftTap: {},
                onRightTap: {logout()}
            )
            .gnb()
            .safeAreaPadding(.horizontal, 24)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 41) {
                    headerSection(nickname: viewModel.nickname(from: signupInfo))
                    
                    paySection()
                    
                    menuSection(title: "고객지원", items: CustomerSupportMenuItem.self)
                }
                .padding(.vertical, 83)
                .safeAreaPadding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)
            .background(Color.white01)
        }
    }
    
    // MARK: - Methods
    
    /// 로그아웃 함수(AppStorage의 signupInfo 초기화, navigationRouter 초기화, appStateViewModel 로그인으로 이동 함수 호출)
    private func logout() {
        signupInfo = Data()
        container.navigationRouter.popToRooteView()
        appStateViewModel.moveToLogin()
    }
}

/// 상단 환영 텍스트, 사각 아이콘 버튼 세션
fileprivate struct headerSection: View {
    let nickname: String
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 5) {
                (
                    Text(nickname)
                        .foregroundStyle(Color.green01)
                    + Text("님")
                        .foregroundStyle(Color.black02)
                )
                .font(.MainTextSemiBold24)
                
                Text("환영합니다! 🙌🏻")
                    .font(.MainTextSemiBold24)
                    .foregroundStyle(Color.black02)
            }
            .frame(maxWidth: .infinity)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: 3),
                spacing: 10
            ) {
                ForEach(OtherSquareButtonItem.allCases, id: \.self) { item in
                    OtherSquareButton(type: item) {
                        print(item.title)
                    }
                    .frame(width: 102, height: 108)
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

/// paySection
fileprivate struct paySection: View {
    var body: some View {
        VStack(spacing: 0) {
            menuSection(title: "Pay", items: PayMenuItem.self)
            Divider()
                .padding(.horizontal, 10)
        }
    }
}

/// menuSection
/// - Parameters:
///   - title: Pay, 고객지원 등의 세션 타이틀
///   - items: CustomImageTextButtonItem & CaseIterable
/// - Returns: 타이틀 + CustomImageTextButton View
fileprivate func menuSection<T: CustomImageTextButtonItem & CaseIterable>(title: String, items: T.Type) -> some View {
    VStack(alignment: .leading, spacing: 8) {
        Text(title)
            .font(.MainTextSemiBold18)
            .foregroundStyle(Color.black)

        LazyVGrid(
            columns: Array(
                repeating: GridItem(.flexible(), spacing: 0),
                count: 2
            ),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(Array(items.allCases), id: \.title) { item in
                CustomImageTextButton(
                    type: item,
                    action: { print(item.title) }
                )
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    OtherView(viewModel: OtherViewModel())
}
