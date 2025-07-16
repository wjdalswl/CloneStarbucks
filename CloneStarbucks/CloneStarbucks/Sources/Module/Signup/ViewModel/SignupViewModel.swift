//
//  SignupViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/11/25.
//

import SwiftUI

@Observable
class SignupViewModel {
    // MARK: - Properties
    
    var nickname: String = ""
    var email: String = ""
    var password: String = ""
    
    var isCreateDisabled: Bool {
        nickname.isEmpty || email.isEmpty || password.isEmpty
    }
    
    // MARK: - Methods
    
    func encodeUser() -> Data? {
        let user = SignupModel(nickname: nickname, email: email, password: password)
        return try? JSONEncoder().encode(user)
    }
}
