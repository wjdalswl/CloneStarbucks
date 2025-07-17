//
//  Product.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import Foundation

protocol Product: Identifiable, Hashable {
    var id: UUID { get }
    var nameKr: String { get }
    var nameEn: String { get }
    var description: String { get }
    var price: Int { get }
    var isNew: Bool { get }
    var imageName: String { get }
}
