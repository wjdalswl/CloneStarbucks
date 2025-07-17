import SwiftUI

@main
struct CloneStarbucksApp: App {
    @StateObject private var container = DIContainer()
    @StateObject private var appStateViewModel = AppStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            switch appStateViewModel.appState {
            case .splash:
                SplashView()
                    .environmentObject(appStateViewModel)
            case .login:
                LoginView(
                    viewModel: LoginViewModel(),
                    onLoginSuccess: {
                        container.navigationRouter.popToRooteView()
                        appStateViewModel.moveToTab()
                    })
                .environmentObject(container)
                .environmentObject(appStateViewModel)
            case .tab:
                CustomTabBarView()
                    .environmentObject(container)
                    .environmentObject(appStateViewModel)
            }
        }
    }
}
