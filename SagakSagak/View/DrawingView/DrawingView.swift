//
//  DrawingView.swift
//  SagakSagak
//
//  Created by 신정연 on 2023/05/08.
//

import SwiftUI

struct Line {
    var points : [CGPoint]
    var color : Color
    var lineWidth : CGFloat
}

let crayonColors1: [(image: String, color: Color)] = [
    ("redcrayon", .red),
    ("orangecrayon", .orange),
    ("yellowcrayon", .yellow),
    ("greencrayon", .green),
    ("bluecrayon", .blue),
    ("purplecrayon", .purple)
]
let crayonColors2: [(image: String, color: Color)] = [
    ("pinkcrayon", .pink),
    ("browncrayon", .brown),
    ("graycrayon", .gray),
    ("blackcrayon", .black),
]


struct DrawingView: View {
    @State private var lines = [Line]()
    @State private var selectedColor : Color = .white
    @State private var selectedWidth : CGFloat = 5
    @State private var isRedTapped : Bool = false
    @State private var isOrangeTapped : Bool = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                //버튼으로 바꾸기
                
                HStack {
                    VStack{
                        Spacer(minLength: 80)
                        ForEach(crayonColors1, id: \.0) { crayon in
                            Image(crayon.image)
                            //.resizable()
                                .scaledToFill()
                                .frame(width: 108, height: 28)
                                .padding(.bottom, 3)
                                .padding(.trailing, 30)
                                .onTapGesture {
                                    selectedWidth = 5
                                    selectedColor = crayon.color
                                    isRedTapped = true
                                }
                                .offset(x: isRedTapped ? 20 : 0, y:-10)
                        }
                        Image("button_back")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .padding(.leading, 24)
                            .padding(.bottom, 24)
                        
                    }
                    .padding(.trailing, 24)
                  //  .layoutPriority(-30)
                    
                    
                    
                    VStack {
                        Text("가람이에게 가장 소중한 것을 그려보자!")
                            .frame(width: 300)
                            .foregroundColor(.blue)
                            .font(.system(size: 18))
                            .padding(.horizontal, 80)
                            .padding(.vertical, 15)
                            .background(Color.white)
                            .cornerRadius(90)
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        Canvas{ context, size in
                            for line in lines {
                                var path = Path()
                                path.addLines(line.points)
                                
                                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                            }
                        }.frame(width: 600, height: 280)
                            .background(Color.white)
                            .cornerRadius(50)
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                                let newPoint = value.location
                                //newPoint : 그림 그리는 다음 위치
                                /*
                                 새로운 라인의 객체
                                 value.translation: 사용자의 터치 이동 거리(이전~이후)
                                 -> 이게 0이면, 새로운 터치를 시작했다는 의미!
                                 */
                                if value.translation.width + value.translation.height == 0{
                                    lines.append(Line(points: [newPoint], color: selectedColor, lineWidth: selectedWidth))
                                }
                                /*
                                 0이 아니면 "이어서 그림"을 의미!
                                 이전 터치의 index를 찾아서,newPoint를 이전에 추가합니다!
                                 */
                                else{
                                    let index = lines.count - 1
                                    lines[index].points.append(newPoint)
                                }
                            }))
                    }
                    
                   // .layoutPriority(100)
                    
                    VStack() {
                        Image("button_exit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .padding(.bottom, 9)
                            .padding(.trailing, 24)
                            .padding(.top, 24)
                        ForEach(crayonColors2, id: \.0) { crayon in
                            Image(crayon.image)
                                .scaledToFill()
                                .frame(width: 108, height: 28)
                                .padding(.bottom, 3)
                                .padding(.leading, 30)
                                .onTapGesture {
                                    selectedWidth = 5
                                    selectedColor = crayon.color
                                    isRedTapped = true
                                }
                                .offset(x: isRedTapped ? -20 : 1, y: 0)
                        }
                        Image("eraser")
//                            .resizable()
                            .offset(x: 21, y: 0)
                            .frame(width: 108, height: 68)
                            .onTapGesture {
                                selectedWidth = 20
                                selectedColor = .white
                            }
                            .padding(.bottom, 3)
                            .padding(.trailing, 24)
                        Image("button_next")
                            .padding(.bottom, 10)
                            .padding(.trailing, 24)
                    }
                    .padding(.leading, 24)
                   // .layoutPriority(0)
                }
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 226/255, green: 246/255, blue: 240/255, opacity: 1.0))
        .ignoresSafeArea()
        
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
