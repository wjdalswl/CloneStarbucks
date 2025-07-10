//
//  MainBottomButtonType.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

enum MainBottomButtonType {
    case login(isDisabled: Bool)
    case create(isDisabled: Bool)
    case viewAd
    case registerCard(isDisabled: Bool)
    case findRoute(isDisabled: Bool)
    case order(isDisabled: Bool)
    
    var title: String {
        switch self {
        case .login:
            return "로그인하기"
        case .create:
            return "생성하기"
        case .viewAd:
            return "자세히보기"
        case .registerCard:
            return "카드 등록하기"
        case .findRoute:
            return "경로 찾기"
        case .order:
            return "주문하기"
        }
    }
    
    var font: Font {
        switch self {
        case .login:
            return .MainTextMedium16
        case .create:
            return .MainTextMedium18
        case .viewAd:
            return .MainTextMedium18
        case .registerCard:
            return .MainTextMedium16
        case .findRoute:
            return .MainTextMedium16
        case .order:
            return .MainTextMedium16
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .login(let isDisabled),
                .create(let isDisabled),
                .registerCard(let isDisabled):
            return isDisabled ? Color.gray02 : Color.green01
        case .viewAd:
            return Color.green01
        case .findRoute(let isDisabled),
                .order(let isDisabled):
            return isDisabled ? Color.gray02 : Color.green00
        }
    }
    
    var textColor: Color {
        switch self {
        default:
            return .white
        }
    }
    
    var height: CGFloat {
        switch self {
        case .login:
            return 46
        case .create:
            return 58
        case .viewAd:
            return 58
        case .registerCard:
            return 38
        case .findRoute:
            return 38
        case .order:
            return 43
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .login:
            return 20
        case .create:
            return 20
        case .viewAd:
            return 20
        case .registerCard:
            return 38
        case .findRoute:
            return 10
        case .order:
            return 43
        }
    }
}
