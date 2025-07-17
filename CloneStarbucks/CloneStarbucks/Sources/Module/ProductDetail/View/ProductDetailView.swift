//
//  ProductDetailView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - Properties
    
    @State var viewModel: ProductDetailViewModel
    
    @State private var selectedTemperature: Temperature?
    @EnvironmentObject var container: DIContainer
    
    // MARK: - Init
    
    /// ProductDetailView
    /// - Parameter viewModel: ProductDetailViewModel
    init(viewModel: ProductDetailViewModel) {
        self._viewModel = State(initialValue: viewModel)
        
        if let firstTemp = viewModel.coffeeModel?.availableTemperatures.first {
            self._selectedTemperature = State(initialValue: firstTemp)
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if let product = viewModel.product {
                ZStack(alignment: .top) {
                    ScrollView {
                        productImageSection(product)
                        Spacer().frame(height: 20)
                        productContentSection(product)
                    }
                    navigationBar()
                }
                orderButton()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarHidden(true)
    }
    
    /// productImageSection
    /// - Parameter product: 상품 -> Product Model
    /// - Returns: 상품 이미지
    @ViewBuilder
    private func productImageSection(_ product: any Product) -> some View {
        Image(product.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
    
    /// productContentSection
    /// - Parameter product: 상품 -> Product Model
    /// - Returns: 상품 정보 세션 반환(커피의 경우 온도 선택 피커 함께 반환)
    @ViewBuilder
    private func productContentSection(_ product: any Product) -> some View {
        VStack(alignment: .leading, spacing: 32) {
            ProductInfoSection(product: product)
            
            if let coffee = viewModel.coffeeModel,
               let selected = selectedTemperature {
                TemperatureSliderPicker(
                    selected: Binding(
                        get: { selected },
                        set: { selectedTemperature = $0 }
                    ),
                    availableTemperatures: coffee.availableTemperatures
                )
            }
        }
        .padding(.horizontal, 10)
    }
    
    /// navigationBar
    /// - Returns: 뒤로가기, 공유하기 버튼 네비게이션 바 반환
    @ViewBuilder
    private func navigationBar() -> some View {
        CustomNavigationBar(
            type: .backAndShare,
            onLeftTap:{ container.navigationRouter.pop()},
            onRightTap: {}
        )
        .safeAreaPadding(.top, 50)
        .safeAreaPadding(.horizontal, 8)
    }
    
    /// orderButton
    /// - Returns: 주문하기 버튼 뷰 반환
    @ViewBuilder
    private func orderButton() -> some View {
        MainBottomButton(
            type: .order(isDisabled: false),
            action: { print("주문하기") }
        )
        .padding(.horizontal, 28)
        .padding(.top, 15)
        .background(
            Rectangle()
                .fill(Color.white)
                .btn1()
        )
    }
}

/// 상품 설명 세션
fileprivate struct ProductInfoSection: View {
    let product: any Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 7) {
                Text(product.nameKr)
                    .font(.MainTextSemiBold24)
                    .foregroundStyle(Color.black03)
                
                if product.isNew {
                    Image(.new)
                }
            }
            Text(product.nameEn)
                .font(.MainTextSemiBold14)
                .foregroundStyle(Color.gray01)
        }

        VStack(alignment: .leading, spacing: 20) {
            Text(product.description)
                .font(.MainTextSemiBold14)
                .foregroundStyle(Color.gray06)
                .multilineTextAlignment(.leading)
            
            Text("\(product.price.formattedWithComma())원")
                .font(.MainTextSemiBold24)
                .foregroundStyle(Color.black03)
        }
    }
}

#Preview {
    let coffee = CoffeeMockData.mockCoffeeList.first!

    ProductDetailView(
        viewModel:
            ProductDetailViewModel(
                type: .coffee,
                id: coffee.id
            )
    )
}
