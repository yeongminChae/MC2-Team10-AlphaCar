//
//  Canvas.swift
//  DrawingApp
//
//  Created by 박리라 on 2023/05/08.
//

import SwiftUI

struct CanvasView: View {
    
    @State private var lines = [Line]()
    
    @Binding var selectColor: Color
    
    @Binding var selectedLineWidth: CGFloat
    
    
    var body: some View {
        
        ZStack {
            Color.system2.ignoresSafeArea()
            VStack {
                Canvas {context, size in
                    
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        
                        context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({value in
                    let newPoint = value.location
                    if value.translation.width + value.translation.height == 0 {
                        
                        lines.append(Line(points: [newPoint], color: selectColor, lineWidth: selectedLineWidth))
                    }else {
                        let index = lines.count - 1
                        lines[index].points.append(newPoint)
                    }
                }))
            }
        }
        
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(selectColor: .constant(Color.system2), selectedLineWidth: .constant(5))
    }
}
