//
//  NavigationRoutingView.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import SwiftUI

struct NavigationRoutingView: View {
    
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    @State var destination: NavigationDestination
    
    var body: some View {
        Group {
            switch destination {
            case .signup:
                SignupView(viewModel: SignupViewModel())
                
            case .productDetail(let type, let id):
                ProductDetailView(
                    viewModel: ProductDetailViewModel(type: type, id: id)
                )
            }
        }
        .environmentObject(container)
    }
}
