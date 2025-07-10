//
//  OtherView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

struct OtherView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel: OtherViewModel
    
    // MARK: - Init
    
    /// OtherView
    /// - Parameter viewModel: OtherViewModel
    init(viewModel: OtherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            navigationBar
            
            ScrollView {
                VStack(alignment: .leading, spacing: 41) {
                    headerSection(viewModel: viewModel)
                        .padding(.top, 40)
                    
                    paySection()
                    
                    menuSection(title: "고객지원", items: CustomerSupportMenuItem.self)
                }
                .safeAreaPadding(.vertical, 83)
                .safeAreaPadding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)
            .background(Color.white01)
        }
    }
    
    // MARK: - Methods
    
    private var navigationBar: some View {
        HStack {
            Text("Other")
                .font(.MainTextBold24)
                .foregroundStyle(Color.black)

            Spacer()

            Button(action: {
                print("로그아웃")
            }) {
                Image(.logout)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 28)
        .padding(.bottom, 16)
        .background(Color.white)
        .gnb()
    }
}

/// 상단 환영 텍스트, 사각 아이콘 버튼 세션
fileprivate struct headerSection: View {
    @ObservedObject var viewModel: OtherViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 5) {
                (
                    Text(viewModel.nickname)
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
