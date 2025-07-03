//
//  Font+.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case extraBold
        case bold
        case semibold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var MainTextExtraBold: Font {
        return .pretend(type: .extraBold, size: 24)
    }
    
    static var MainTextBold24: Font {
        return .pretend(type: .bold, size: 24)
    }
    
    static var MainTextBold22: Font {
        return .pretend(type: .bold, size: 22)
    }
    
    static var MainTextBold20: Font {
        return .pretend(type: .bold, size: 20)
    }
    
    static var MainTextBold16: Font {
        return .pretend(type: .bold, size: 16)
    }
    
    static var MainTextSemiBold38: Font {
        return .pretend(type: .semibold, size: 38)
    }
    
    static var MainTextSemiBold24: Font {
        return .pretend(type: .semibold, size: 24)
    }
    
    static var MainTextSemiBold18: Font {
        return .pretend(type: .semibold, size: 18)
    }
    
    static var MainTextSemiBold16: Font {
        return .pretend(type: .semibold, size: 16)
    }
    
    static var MainTextSemiBold14: Font {
        return .pretend(type: .semibold, size: 14)
    }
    
    static var MainTextSemiBold13: Font {
        return .pretend(type: .semibold, size: 13)
    }
    
    static var MainTextSemiBold12: Font {
        return .pretend(type: .semibold, size: 12)
    }
    
    static var MainTextRegular18: Font {
        return .pretend(type: .regular, size: 18)
    }
    
    static var MainTextRegular13: Font {
        return .pretend(type: .regular, size: 13)
    }
    
    static var MainTextRegular12: Font {
        return .pretend(type: .regular, size: 12)
    }
    
    static var MainTextRegular09: Font {
        return .pretend(type: .regular, size: 09)
    }
    
    static var MainTextMedium18: Font {
        return .pretend(type: .medium, size: 18)
    }
    
    static var MainTextMedium16: Font {
        return .pretend(type: .medium, size: 16)
    }
    
    static var MainTextMedium13: Font {
        return .pretend(type: .medium, size: 13)
    }
    
    static var MainTextMedium10: Font {
        return .pretend(type: .medium, size: 10)
    }
    
    static var MainTextMedium8: Font {
        return .pretend(type: .medium, size: 8)
    }
    
    static var MainTextLight14: Font {
        return .pretend(type: .light, size: 14)
    }
}
