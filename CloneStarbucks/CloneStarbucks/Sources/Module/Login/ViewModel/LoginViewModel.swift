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
    
    // MARK: - Methods
    
    func verifyUser(from data: Data?) -> RequestResult {
        guard let data else {
            return .failure("회원 정보가 없습니다. 회원가입을 해주세요")
        }
        
        guard let user = try? JSONDecoder().decode(SignupModel.self, from: data) else {
            return .failure("회원 정보가 없습니다. 회원가입을 해주세요")
        }
        
        if id != user.email {
            return .failure("이메일이 일치하지 않습니다.")
        }
        
        if pwd != user.password {
            return .failure("비밀번호가 일치하지 않습니다.")
        }
        
        return .success
    }
}
