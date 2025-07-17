//
//  BreadModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct BreadModel: Product, Codable {
    var id: UUID = UUID()
    let nameKr: String
    let nameEn: String
    let description: String
    let price: Int
    let isNew: Bool
    let imageName: String
}
