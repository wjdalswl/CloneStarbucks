//
//  OtherSquareButtonItem.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

enum OtherSquareButtonItem:CaseIterable {
    case starHistory
    case eReceipt
    case myMenu
    
    var title: String {
        switch self {
        case .starHistory: return "별 히스토리"
        case .eReceipt: return "전자 영수증"
        case .myMenu: return "나만의 메뉴"
        }
    }
    
    var icon: Image {
        switch self {
        case .starHistory:
            return Image("starHistory")
        case .eReceipt:
            return Image("eReceipt")
        case .myMenu:
            return Image("myMenu")
        }
    }
}
