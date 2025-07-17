//
//  SplashView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/4/25.
//

import SwiftUI

struct SplashView: View {
    // MARK: - Properties
    
    @EnvironmentObject private var appStateViewModel: AppStateViewModel
    @AppStorage("signupInfo") private var signupInfo: Data = Data()
    
    // MARK: - Body

    var body: some View {
        ZStack {
            Color(.green01)
                .ignoresSafeArea()
            
            Image(.starbucsLogo)
                .resizable()
                .frame(width: 168, height: 168)
        }
        .task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            if let user = try? JSONDecoder().decode(SignupModel.self, from: signupInfo),
               !user.nickname.isEmpty {
                appStateViewModel.moveToTab()
            } else {
                appStateViewModel.moveToLogin()
            }
        }
    }
}

#Preview {
    SplashView()
}
