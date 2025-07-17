//
//  AdModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct AdModel: Identifiable {
    var id: UUID = UUID()
    let title: String
    let content: String
    let imageName: String
}
