//
//  ShadowModifier.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import Foundation
import SwiftUI

/// Btn1
struct Btn1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 2.5, x: 0, y: 0)
    }
}

/// Gnb
struct Gnb: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 3)
    }
}

/// DropShadow
struct DropShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 1)
    }
}


// MARK: - extension

extension View {
    func btn1() -> some View {
        self.modifier(Btn1())
    }
    
    func gnb() -> some View {
        self.modifier(Gnb())
    }
    
    func dropShadow() -> some View {
        self.modifier(DropShadow())
    }
}
