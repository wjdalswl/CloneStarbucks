//
//  ProductDetailViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

@Observable
class ProductDetailViewModel: ObservableObject {
    let productType: ProductType
    var product: (any Product)?
    
    var coffeeModel: CoffeeModel? {
        productType == .coffee ? (product as? CoffeeModel) : nil
    }
    
    init(type: ProductType, id: UUID) {
        self.productType = type
        switch type {
        case .coffee:
            self.product = CoffeeMockData.findCoffee(by: id)
        case .bread:
            self.product = BreadMockData.findBread(by: id)
        }
    }
}
