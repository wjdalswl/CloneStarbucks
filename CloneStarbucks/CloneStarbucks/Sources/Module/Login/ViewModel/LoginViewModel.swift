//
//  LoginViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var id: String = ""
    @Published var pwd: String = ""
    
    var isLoginDisabled: Bool {
        id.isEmpty || pwd.isEmpty
    }
}
