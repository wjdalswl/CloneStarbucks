//
//  OtherViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

class OtherViewModel: ObservableObject {
    // MARK: - Properties
    
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    
    var nickname: String {
        if let user = try? JSONDecoder().decode(SignupModel.self, from: signupInfo) {
            return user.nickname
        }
        return "(작성한 닉네임)"
    }
}
