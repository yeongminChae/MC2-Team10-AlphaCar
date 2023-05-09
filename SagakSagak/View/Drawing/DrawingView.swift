//
//  DrawingView.swift
//  DrawingApp
//
//  Created by 박리라 on 2023/05/08.
//

import SwiftUI

struct DrawingView: View {
    
    @State private var selectColor: Color = .system2
    
    @State private var selectedLineWidth: CGFloat = 5 // 기본 선 굵기
    
    var body: some View {
        ZStack {

            Color.bg2.ignoresSafeArea()
            
            Image("background")
                .resizable()
                .scaledToFit()


            HStack{
                VStack{
                    Button(action: {selectColor = .crayon1
                    }) {
                        Image("redcrayon")
                    }
                    Button(action: {selectColor = .crayon2
                    }) {
                        Image("orangecrayon")
                    }
                    Button(action: {selectColor = .crayon3
                    }) {
                        Image("yellowcrayon")
                    }
                    Button(action: {selectColor = .crayon4
                    }) {
                        Image("greencrayon")
                    }
                    Button(action: {selectColor = .crayon5
                    }) {
                        Image("bluecrayon")
                    }
                    Button(action: {selectColor = .crayon6
                    }) {
                        Image("purplecrayon")
                    }
                }
                
                CanvasView(selectColor: $selectColor, selectedLineWidth: $selectedLineWidth).frame(width: 550, height: 300)
                    .cornerRadius(20)
                
                VStack{
                    Button(action: {selectColor = .crayon7
                    }) {
                        Image("pinkcrayon")
                    }
                    Button(action: {selectColor = .crayon8
                    }) {
                        Image("browncrayon")
                    }
                    Button(action: {selectColor = .crayon9
                    }) {
                        Image("graycrayon")
                    }
                    Button(action: {selectColor = .crayon10
                    }) {
                        Image("blackcrayon")
                    }
                    Button(action: {
                        selectColor = .system2
                        selectedLineWidth = 20 }) {
                        Image("eraser")
                    }
                }
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
