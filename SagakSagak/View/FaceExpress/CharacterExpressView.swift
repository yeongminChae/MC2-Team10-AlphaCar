//
//  CharacterExpressView.swift
//  Faceapp
//
//  Created by 박리라 on 2023/05/10.
//

import SwiftUI

struct CharacterExpressView: View {
    @Binding var selectedFace: String
    
    var body: some View {
        ZStack{
            Image("character").resizable().offset(y:-20)
            Image(selectedFace).offset(x:-30)
        }
    }
}

struct CharacterExpressView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterExpressView(selectedFace: .constant("face_happy"))
    }
}
