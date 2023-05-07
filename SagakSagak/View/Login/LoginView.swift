//
//  LoginView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Button("회원가입 화면으로 이동"){
            coordinator.push(.signup)
        }
        .navigationTitle("로그인뷰")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
