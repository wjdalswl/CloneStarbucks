//
//  SignupViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    
    var isCreateDisabled: Bool {
        nickname.isEmpty || email.isEmpty || password.isEmpty
    }
    
    // MARK: - Methods
    
    func saveUser() {
        let user = SignupModel(
            nickname: nickname,
            email: email,
            password: password
        )
        if let data = try? JSONEncoder().encode(user) {
            signupInfo = data
        }
    }
}
