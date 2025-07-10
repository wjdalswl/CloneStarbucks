//
//  CustomerSupportMenuItem.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

enum CustomerSupportMenuItem: CaseIterable, CustomImageTextButtonItem {
    case storeCare
    case voiceOfCustomer
    case storeInfo
    case returnInfo
    case myReview
    
    var title: String {
        switch self {
        case .storeCare: return "스토어 케어"
        case .voiceOfCustomer: return "고객의 소리"
        case .storeInfo: return "매장 정보"
        case .returnInfo: return "반납기 정보"
        case .myReview: return "마이 스타벅스 리뷰"
        }
    }
    
    var icon: Image {
        switch self {
        case .storeCare:
            return Image("storeCare")
        case .voiceOfCustomer:
            return Image("voiceOfCustomer")
        case .storeInfo:
            return Image("storeInfo")
        case .returnInfo:
            return Image("returnInfo")
        case .myReview:
            return Image("myReview")
        }
    }
}
