//
//  AppStateViewModel.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

final class AppStateViewModel: ObservableObject {
    @Published var appState: AppState = .splash
    
    /// 로그인으로 이동 (스플래쉬 후, 로그아웃 후)
    func moveToLogin() {
        appState = .login
    }
    
    /// 탭바로 이동 (자동 로그인 or 로그인 시)
    func moveToTab() {
        appState = .tab
    }
    
    /// 스플래쉬로 리셋 (앱 실행시)
    func resetToSplash() {
        appState = .splash
    }
}
