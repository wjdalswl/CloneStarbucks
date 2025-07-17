//
//  CustomNavigationBar.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    // MARK: - Properties
    
    let type: NavigationBarType
    let onLeftTap: (() -> Void)?
    let onRightTap: (() -> Void)?
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            switch type {
            case .backAndShare,
                    .backAndTitle,
                    .backOnly,
                    .backTitleAndPlus:
                centerTitleNavi
            case .leftTitleOnly,
                    .leftTitleAndPlus,
                    .leftTitleAndLogout:
                leftTitleNavi
            }
        }
        .frame(height: 68)
    }

    private var centerTitleNavi: some View {
        HStack {
            leftIcon
                .frame(width: 90, alignment: .leading)
            Spacer()
            title
            Spacer()
            rightIcon
                .frame(width: 90, alignment: .trailing)
        }
    }
    
    private var leftTitleNavi: some View {
        HStack {
            title
            Spacer()
            rightIcon
                .frame(width: 90, alignment: .trailing)
        }
    }
}

// MARK: - Components

extension CustomNavigationBar {
    private var leftIcon: some View {
        HStack {
            if let icon = type.left {
                navigationIconButton(icon: icon, action: onLeftTap)
            }
        }
    }
    
    private var rightIcon: some View {
        HStack {
            if let icon = type.right {
                navigationIconButton(icon: icon, action: onRightTap)
            }
        }
    }
    
    @ViewBuilder
    private func navigationIconButton(
        icon: NavigationIcon,
        action: (() -> Void)?
    ) -> some View {
        if let image = icon.image {
            Button(action: {
                action?()
            }, label: {
                image
                    .renderingMode(.template)
                    .frame(width: type.iconSize.width, height: type.iconSize.height)
                    .foregroundStyle(type.iconForegroundColor)
                    .background(type.iconBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: type.iconCornerRadius))
            })
        }
    }
    
    @ViewBuilder
    private var title: some View {
        if let title = type.centerTitle {
            Text(title)
                .font(.MainTextMedium16)
                .foregroundStyle(Color.black)
        } else if let title = type.leftTitle {
            Text(title)
                .font(.MainTextBold24)
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    CustomNavigationBar(
        type: .backOnly,
        onLeftTap: {},
        onRightTap: {}
    )
    
    CustomNavigationBar(
        type: .backAndShare,
        onLeftTap: {},
        onRightTap: {}
    )
    CustomNavigationBar(
        type: .backAndTitle(title: "매장찾기"),
        onLeftTap: {},
        onRightTap: {}
    )
   
    CustomNavigationBar(
        type: .backAndTitle(title: "가입하기"),
        onLeftTap: {},
        onRightTap: {}
    )
    CustomNavigationBar(
        type: .backTitleAndPlus(title: "전자영수증"),
        onLeftTap: {},
        onRightTap: {}
    )
    
    CustomNavigationBar(
        type: .leftTitleAndPlus(title: "Pay"),
        onLeftTap: {},
        onRightTap: {}
    )
    
    CustomNavigationBar(
        type: .leftTitleOnly(title: "Order"),
        onLeftTap: {},
        onRightTap: {}
    )
    CustomNavigationBar(
        type: .leftTitleAndLogout(title: "Other"),
        onLeftTap: {},
        onRightTap: {}
    )
}
