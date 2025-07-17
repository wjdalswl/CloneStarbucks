//
//  HomeViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let recommendedCoffees: [CoffeeModel] = CoffeeMockData.mockCoffeeList
    let recommendedBreads: [BreadModel] = BreadMockData.mockBreadList
    let whatsNewItems: [AdModel] = AdMockData.mockAdList
    
    let topBanners: [ImageResource] = [
        .banner2YellowEvent,
        .banner3ServiceSuscibe
    ]
    
    let bottomBanners: [ImageResource] = [
        .banner4MugCup,
        .banner5OnlineStore,
        .banner6Delivery
    ]
    
    let finalBanners: [ImageResource] = [
        .banner7ColdBrew,
        .banner8Barista,
        .banner9SmileClub
    ]
    
    // MARK: - Methods
    
    func nickname(from data: Data) -> String {
        if let user = try? JSONDecoder().decode(SignupModel.self, from: data) {
            return user.nickname
        }
        return "(설정 닉네임)"
    }
}
