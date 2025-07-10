//
//  CustomTextFieldType.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

enum CustomTextFieldType {
    case login
    case signup

    var font: Font {
        switch self {
        case .login:
            return .MainTextRegular13
        case .signup:
            return .MainTextRegular18
        }
    }

    var underlineSpacing: CGFloat {
        switch self {
        case .login:
            return 2
        case .signup:
            return 9
        }
    }
    
    var focusColor: Color {
        switch self {
        case .login, .signup:
            return .green01
        }
    }
    
    var unfocusedColor: Color {
        switch self {
        case .login, .signup:
            return .gray00
        }
    }
}
