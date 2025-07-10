//
//  TabBarItem.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

enum TabBarItem: CaseIterable, Identifiable {
    case home
    case pay
    case order
    case shop
    case other
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .pay:
            return "Pay"
        case .order:
            return "Order"
        case .shop:
            return "Shop"
        case .other:
            return "Other"
        }
    }
    
    var icon: Image {
        switch self {
        case .home:
            return Image("tabHome")
        case .pay:
            return Image("tabPay")
        case .order:
            return Image("tabOrder")
        case .shop:
            return Image("tabShop")
        case .other:
            return Image("tabOther")
        }
    }
    
    var selectedIconColor: Color {
        return Color.green02
    }
    
    var unselectedIconColor: Color {
        return Color.gray03
    }
    
    var selectedTextColor: Color {
        return Color.green02
    }
    
    var unselectedTextColor: Color {
        return Color.black01
    }
}
