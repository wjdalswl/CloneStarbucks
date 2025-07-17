//
//  NavigationIcon.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

enum NavigationIcon: Hashable {
    case backArrow
    case logout
    case plus
    case share
    case none

    var image: Image? {
        switch self {
        case .backArrow:
            return Image(.backArrow)
        case .logout:
            return Image(.logout)
        case .plus:
            return Image(.plus)
        case .share:
            return Image(.share)
        case .none:
            return nil
        }
    }
}

