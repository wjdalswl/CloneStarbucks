//
//  Temperature.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

enum Temperature: String, CaseIterable {
    case hot = "HOT"
    case iced = "ICED"
    
    func color(isSelected: Bool) -> Color {
        if isSelected {
            switch self {
            case .hot:
                return .red01
            case .iced:
                return .blue01
            }
        } else {
            return .gray02
        }
    }
}
