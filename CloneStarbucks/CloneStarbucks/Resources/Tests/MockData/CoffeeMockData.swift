//
//  CoffeeMockData.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import Foundation

enum CoffeeMockData {
    
    // MARK: - Methods
    
    static func findCoffee(by id: UUID) -> CoffeeModel? {
        mockCoffeeList.first { $0.id == id }
    }
    
    // MARK: - Properties
    
    static let mockCoffeeList: [CoffeeModel] = [
        CoffeeModel(
            id: UUID(),
            nameKr: "카페 아메리카노",
            nameEn: "Caffe Americano",
            description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피",
            price: 4700,
            isNew: true,
            imageName: "cafeAmericano",
            availability: .hotAndIced
        ),
        CoffeeModel(
            id: UUID(),
            nameKr: "아이스 카페 아메리카노",
            nameEn: "Iced Caffe Americano",
            description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
            price: 4700,
            isNew: true,
            imageName: "icedAmericano",
            availability: .hotAndIced
        ),
        CoffeeModel(
            id: UUID(),
            nameKr: "에스프레소 마끼아또",
            nameEn: "Espresso Macchiato",
            description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
            price: 3900,
            isNew: true,
            imageName: "espressoMacchiato",
            availability: .icedOnly
        ),
        CoffeeModel(
            id: UUID(),
            nameKr: "카라멜 마끼아또",
            nameEn: "Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            price: 6100,
            isNew: true,
            imageName: "caramelMacchiato",
            availability: .hotAndIced
        ),
        CoffeeModel(
            id: UUID(),
            nameKr: "에스프레소 콘 파나",
            nameEn: "Espresso Con Panna",
            description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 진한 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
            price: 4100,
            isNew: true,
            imageName: "espressoConPanna",
            availability: .hotOnly
        ),
        CoffeeModel(
            id: UUID(),
            nameKr: "아이스 카라멜 마끼아또",
            nameEn: "Iced Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            price: 6100,
            isNew: true,
            imageName: "icedCaramelMacchiato",
            availability: .hotAndIced
        )
    ]
}
