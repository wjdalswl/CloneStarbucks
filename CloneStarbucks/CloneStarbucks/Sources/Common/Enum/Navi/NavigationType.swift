//
//  NavigationType.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import Foundation
import SwiftUI

enum NavigationBarType: Hashable {
    case backOnly // 왼쪽 뒤로 가기만
    case backAndShare // 왼쪽 뒤로가기, 오른쪽 공유 버튼
    case backAndTitle(title: String) // 왼쪽 뒤로가기, 가운데 텍스트
    case backTitleAndPlus(title: String) // 왼쪽 뒤로가기, 가운데 텍스트, 오른쪽 플러스
    
    case leftTitleOnly(title: String) // 왼쪽 텍스트만
    case leftTitleAndPlus(title: String) // 왼쪽 텍스트, 오른쪽 플러스
    case leftTitleAndLogout(title: String) // 왼쪽 텍스트, 오른쪽 로그아웃
    
    
    // MARK: - Icon
    
    /// 왼쪽 아이콘 모음
    var left: NavigationIcon? {
        switch self {
        case .leftTitleOnly, .leftTitleAndPlus, .leftTitleAndLogout:
            return nil
        case .backOnly, .backAndShare, .backAndTitle, .backTitleAndPlus:
            return .backArrow
        }
    }
    
    /// 오른쪽 아이콘
    var right: NavigationIcon? {
        switch self {
        case .backOnly, .backAndTitle, .leftTitleOnly:
            return nil
        case .backAndShare:
            return .share
        case .backTitleAndPlus, .leftTitleAndPlus:
            return .plus
        case .leftTitleAndLogout:
            return .logout
        }
    }
    
    /// 아이콘 사이즈
    var iconSize: CGSize {
        switch self {
        case .backAndShare:
            return CGSize(width: 32, height: 32)
        case .leftTitleAndLogout:
            return CGSize(width: 35, height: 35)
        default:
            return CGSize(width: 20, height: 20)
        }
    }
    
    /// 아이콘 색상
    var iconForegroundColor: Color {
        switch self {
        case .backAndShare:
            return .white
        default:
            return .black
        }
    }
    
    /// 아이콘 뒷 배경 색상
    var iconBackgroundColor: Color {
        switch self {
        case .backAndShare:
            return Color.black.opacity(0.4)
        default:
            return .clear
        }
    }
    
    /// 아이콘 뒷 배경 CornerRadius
    var iconCornerRadius: CGFloat {
        switch self {
        case .backAndShare:
            return .infinity
        default:
            return 0
        }
    }
    
    // MARK: - Title
    
    /// 센터 타이틀
    var centerTitle: String? {
        switch self {
        case .backAndTitle(let title), .backTitleAndPlus(let title):
            return title
        default:
            return nil
        }
    }
    
    /// 왼쪽 타이틀
    var leftTitle: String? {
        switch self {
        case .leftTitleOnly(let title), .leftTitleAndPlus(let title), .leftTitleAndLogout(let title):
            return title
        default:
            return nil
        }
    }
}
