//
//  SquareImageCard.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct SquareImageCard: View {
    // MARK: - Properties
    
    private let imageName: String
    private let title: String
    private let content: String
    
    // MARK: - Init
    
    /// SquareImageCard
    /// - Parameters:
    ///   - imageName: 이미지 이름 String 값
    ///   - title: title String 값
    ///   - content: content String 값
    init(
        imageName: String,
        title: String,
        content: String,
    ) {
        self.imageName = imageName
        self.title = title
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Spacer().frame(height: 16)
            
            Text(title)
                .font(.MainTextSemiBold18)
                .foregroundStyle(Color.black02)
                .lineLimit(1)
            
            Spacer().frame(height: 19)
            
            Text(title)
                .font(.MainTextSemiBold13)
                .foregroundStyle(Color.gray03)
        }
    }
}

#Preview {
    SquareImageCard(
        imageName: "ad1",
        title: "25년 3월 일회용컵 없는 날 캠페인에 참여하세요.",
        content: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."
    )
}
