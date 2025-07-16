//
//  LoginViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

@Observable
class LoginViewModel {
    // MARK: - Properties
    
    var id: String = ""
    var pwd: String = ""
    
    var isLoginDisabled: Bool {
        id.isEmpty || pwd.isEmpty
    }
}
