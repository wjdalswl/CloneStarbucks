//
//  TemperatureSliderPicker.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct TemperatureSliderPicker: View {
    // MARK: - Properties
    
    @Binding private var selected: Temperature
    private var availableTemperatures: [Temperature]
    
    @Namespace private var animation
    
    // MARK: - Init
    
    /// TemperatureSliderPicker
    /// - Parameters:
    ///   - selected: 초기 선택 값, iced만 있을 경우 iced만 선택하고 있어야함
    ///   - availableTemperatures: 선택가능한 Temperature 배열
    init(
        selected: Binding<Temperature>,
        availableTemperatures: [Temperature]
    ) {
        self._selected = selected
        self.availableTemperatures = availableTemperatures
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(availableTemperatures, id: \.self) { temp in
                Button(action: {
                    withAnimation(.spring()) {
                        selected = temp
                    }
                }) {
                    ZStack {
                        if selected == temp {
                            Capsule()
                                .fill(Color.white)
                                .dropShadow()
                                .matchedGeometryEffect(id: "slider", in: animation)
                        }
                        
                        Text(temp.rawValue)
                            .font(.MainTextSemiBold18)
                            .foregroundStyle(temp.color(isSelected: selected == temp))
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .background(
            Capsule()
                .fill(Color.gray07)
        )
    }
}

#Preview {
    @Previewable @State var selectedTemp: Temperature = .iced
    let availableTemps: [Temperature] = [.hot, .iced]
    
    TemperatureSliderPicker(
        selected: $selectedTemp,
        availableTemperatures: availableTemps
    )
    .frame(height: 36)
}
