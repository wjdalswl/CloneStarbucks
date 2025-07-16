//
//  OtherViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

@Observable
class OtherViewModel {
    // MARK: - Methods
    
    func nickname(from data: Data) -> String {
        if let user = try? JSONDecoder().decode(SignupModel.self, from: data) {
            return user.nickname
        }
        return "(작성한 닉네임)"
    }
}
