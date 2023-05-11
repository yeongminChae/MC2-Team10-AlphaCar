//
//  Letter.swift
//  MC2_Practice
//
//  Created by 채영민 on 2023/05/09.
//

import SwiftUI

struct Letter: View {
    @State private var coverPosition: CGFloat = 50
    @State private var letterPosition: CGFloat = 50
    @State private var isAnimating: Bool = false
    @State private var letterOpacity: Double = 1
    @State private var letterOpacityReverse: Double = 0
    
    func animateOpacityAndPosition(opacity: Double, position: CGFloat, duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.easeOut(duration: duration)) {
                self.letterOpacity = opacity
                self.coverPosition = position
            }
        }
    }
    
    func animateOpacity(opacity: Double, duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.easeOut(duration: duration)) {
                self.letterOpacityReverse = opacity
            }
        }
    }
    
    func animatePosition(position: CGFloat, duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(Animation.easeOut(duration: duration)) {
                self.letterPosition = position
            }
        }
    }
    
    
    var body: some View {
        ZStack {
            Image("Group 10226").padding(.top,20)
            Rectangle().foregroundColor(Color(hex: "D5F0E7").opacity(0.5)).ignoresSafeArea()
            
        ZStack{
                Image("button")
                
                Image("letterHead")
                    .offset(x:0, y:coverPosition + 8)
                    .opacity(letterOpacity)
                    .onAppear {
                        animateOpacityAndPosition(opacity: 0, position: 300, duration: 2)
                    }
            ZStack{
                Image("lettterBody")
                    .offset(x:0, y: letterPosition + 215)
                    .onAppear {
                        animatePosition(position: -200, duration: 0.75)
                    }
                
                Image("나에게 가장 소중한 것은 무엇일까_")
                    .offset(x:0, y: letterPosition + 230)
                
                Image("오늘의_이야기")
                    .offset(x:0, y: letterPosition + 90)
                    .opacity(letterOpacityReverse)
                    .onAppear {
                        animateOpacity(opacity: 1, duration: 0.5)
                    }
            }
            
            Image("greenButton")
                .offset(x:350, y:-110)
                .opacity(letterOpacityReverse)
                .onAppear {
                    animateOpacity(opacity: 1, duration: 1)
                }
                
            Image("letterFoot").offset(x:0, y:coverPosition + 115)
                .opacity(letterOpacity)
                .onAppear {
                    animateOpacityAndPosition(opacity: 0, position: 100, duration: 2)
                }
            }
        }
    }
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter()
    }
}
