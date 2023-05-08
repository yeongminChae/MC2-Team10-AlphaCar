//
//  SplashView.swift
//  SagakSagak
//
//  Created by Joy on 2023/05/07.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        
        Button("로그인 화면으로 이동"){
            coordinator.push(.login)
        }
        .navigationTitle("스플래시 화면")
    }
    
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
