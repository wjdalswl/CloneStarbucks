//
//  DIContainer.swift
//  CloneStarbucks
//
//  Created by jeongminji on 7/17/25.
//

import Foundation

class DIContainer: ObservableObject {
    @Published var navigationRouter: NavigationRouter
    
    init(
        navigationRouter: NavigationRouter = .init()
    ) {
        self.navigationRouter = navigationRouter
    }
}
