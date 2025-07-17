//
//  RewardProgressView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct RewardProgressView: View {
    // MARK: - Properties
    
    private let currentStars: Int
    private let totalStars: Int
    private let height: CGFloat
    
    private var remainingStars: Int {
        max(totalStars - currentStars, 0)
    }
    
    private var progress: Double {
        min(Double(currentStars) / Double(totalStars), 1.0)
    }
    
    // MARK: - Init
    
    /// RewardProgressView
    /// - Parameters:
    ///   - currentStars: 현재 모은 별 수
    ///   - totalStars: 전체 별 수
    ///   - height: ProgressView 높이
    init(
        currentStars: Int,
        totalStars: Int = 12,
        height: CGFloat = 8
    ) {
        self.currentStars = currentStars
        self.totalStars = totalStars
        self.height = height
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(remainingStars)★ until next Reward")
                .font(.MainTextSemiBold16)
                .foregroundStyle(Color.brown02)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: height / 2)
                        .fill(Color.gray07)
                        .frame(height: height)
                    
                    RoundedRectangle(cornerRadius: height / 2)
                        .fill(Color.brown02)
                        .frame(width: geometry.size.width * progress, height: height)
                        .animation(.easeInOut(duration: 0.3), value: progress)
                }
            }
            .frame(height: height)
        }
    }
}

// MARK: - Preview

#Preview {
    RewardProgressView(currentStars: 1)
        .padding()
}
