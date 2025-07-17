//
//  Int+.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import Foundation

extension Int {
    func formattedWithComma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
