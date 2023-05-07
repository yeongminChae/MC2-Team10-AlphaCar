//
//  Coordinator.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import SwiftUI

// MARK: 화면 전환 종류
enum Page: String, Identifiable {
    case splash, login, signup
    
    var id: String {
        self.rawValue
    }
}

//ObservableObject
class Coordinator: ObservableObject{
    @Published var path = NavigationPath() //16버전부터만 가능

    // MARK: 화면 전환
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot(){
        path.removeLast(path.count)
    }
    
    // MARK: ViewBuilder
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .splash:
            SplashView()
        case .login:
            LoginView()
        case .signup:
            SignUpView()
        }
    }
    
    
}

