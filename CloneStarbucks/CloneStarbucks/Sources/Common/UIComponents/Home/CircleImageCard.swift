//
//  CircleImageCard.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct CircleImageCard: View {
    // MARK: - Properties
    
    private let imageName: String
    private let title: String
    
    // MARK: - Init
    
    /// CircleImageCard
    /// - Parameters:
    ///   - imageName: 이미지 이름 String 값
    ///   - title: title에 들어갈 String 값
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .clipShape(Circle())
            
            Text(title)
                .font(.MainTextSemiBold14)
                .foregroundStyle(Color.black02)
        }
    }
}

#Preview {
    CircleImageCard(
        imageName: "cafeAmericano",
        title: "아이스 카페 아메리카노"
    )
    .frame(width: 130)
}
