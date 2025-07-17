//
//  BreadMockData.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import Foundation

enum BreadMockData {
    
    // MARK: - Methods
    
    static func findBread(by id: UUID) -> BreadModel? {
        mockBreadList.first { $0.id == id }
    }
    
    // MARK: - Properties
    
    static let mockBreadList: [BreadModel] = [
        BreadModel(
            nameKr: "너티 크루아상",
            nameEn: "Nutty Croissant",
            description: "고소한 너트와 바삭한 페이스트리가 어우러진 클래식한 크루아상",
            price: 4500,
            isNew: true,
            imageName: "nuttyCroissant"
        ),
        BreadModel(
            nameKr: "매콤 소시지 불고기",
            nameEn: "Spicy Sausage Bulgogi",
            description: "매콤한 불고기 소시지와 담백한 빵이 어우러진 든든한 한 끼",
            price: 5200,
            isNew: false,
            imageName: "spicySausageBulgogi"
        ),
        BreadModel(
            nameKr: "미니 리프 파이",
            nameEn: "Mini Leaf Pies",
            description: "겹겹이 쌓인 바삭한 페이스트리에 은은한 달콤함이 감도는 미니 파이",
            price: 3900,
            isNew: false,
            imageName: "miniLeafPies"
        ),
        BreadModel(
            nameKr: "뺑 오 쇼콜라",
            nameEn: "Pain au Chocolat",
            description: "버터 풍미 가득한 페이스트리에 진한 초콜릿이 더해진 프랑스식 빵",
            price: 4700,
            isNew: true,
            imageName: "bbaengOhChocolat"
        ),
        BreadModel(
            nameKr: "소시지&올리브 파이",
            nameEn: "Sausage & Olive Pie",
            description: "풍미 가득한 소시지와 짭짤한 올리브가 들어간 특별한 파이",
            price: 5100,
            isNew: false,
            imageName: "sausage_OlivePie"
        ),
    ]
}
