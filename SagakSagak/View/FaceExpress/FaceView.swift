//
//  FaceView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

struct FaceView: View {
    @Binding var selectedFace: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 844, height: 88)
                .foregroundColor(.white)
            HStack{
                Button(action: {
                    selectedFace = "face_excited"
                }) {
                    Image("face_excited")
                }
                Button(action: {
                    selectedFace = "face_lovely"
                }) {
                    Image("face_lovely")
                }
                Button(action: {
                    selectedFace = "face_sad"
                }) {
                    Image("face_sad")
                }
                Button(action: {
                    selectedFace = "face_boring"
                }) {
                    Image("face_boring")
                }
                Button(action: {
                    selectedFace = "face_happy"
                }) {
                    Image("face_happy")
                }
                Button(action: {
                    selectedFace = "face_angry"
                }) {
                    Image("face_angry")
                }
            }
        }
    }
}


struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        FaceView(selectedFace: .constant("face_happy"))
    }
}
