//
//  SplashView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

public struct SplashView: View {
    public init() {}
    
    public var body: some View {
        ZStack(alignment: .center) {
            Color(.green01)
                .ignoresSafeArea(edges: .all)
            
            Image(.starbucsLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 168, height: 168)
        }
    }
}

#Preview {
    SplashView()
}
