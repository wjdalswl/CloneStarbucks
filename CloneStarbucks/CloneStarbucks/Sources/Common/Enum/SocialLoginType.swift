//
//  SocialLoginType.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

enum SocialLoginType {
    case kakao
    case apple

    var image: Image {
        switch self {
        case .kakao:
            return Image(.kakaoLogin)
        case .apple:
            return Image(.appleLogin)
        }
    }
}
