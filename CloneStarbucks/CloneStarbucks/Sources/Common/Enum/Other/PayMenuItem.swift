//
//  PayMenuItem.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

enum PayMenuItem: CaseIterable, CustomImageTextButtonItem {
    case registerCard
    case registerVoucher
    case registerCoupon
    case couponHistory
    
    var title: String {
        switch self {
        case .registerCard: return "스타벅스 카드 등록"
        case .registerVoucher: return "카드 교환권 등록"
        case .registerCoupon: return "쿠폰 등록"
        case .couponHistory: return "쿠폰 히스토리"
        }
    }
    
    var icon: Image {
        switch self {
        case .registerCard:
            return Image("registerCard")
        case .registerVoucher:
            return Image("registerVoucher")
        case .registerCoupon:
            return Image("registerCoupon")
        case .couponHistory:
            return Image("couponHistory")
        }
    }
}
