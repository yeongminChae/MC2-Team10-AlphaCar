//
//  SwiftUIView.swift
//  MC2_Practice
//
//  Created by 채영민 on 2023/05/10.
//

import SwiftUI
import UIKit
import AVFoundation

struct ToCameraView: View {
    @State private var isClicked: Bool = false 
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var showCamera: Bool = false
    @State private var isShowingCamera: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color(hex: "D5F0E7")).ignoresSafeArea()
            Image("greenCutton")
            
            VStack {
                Image("추억이_담긴_액자")
                
                ZStack {
                    ZStack {
                        if selectedImage == nil {
                            Image("defaultImg").padding(.top, 20)
                        }else{
                            Image(uiImage: selectedImage!).resizable()
                                .frame(width: 180,height: 140).padding(.top, 35)
                        }
                    
                        Image("defaultFrame")
                    }.onTapGesture {
                        isClicked = true
                    }
                    if isClicked {
                        ZStack {
                            Image("modal").padding(.all, -100)
                            Image("blueXBtn").offset(x: 260, y: -130)
                                .onTapGesture {
                                    isClicked = false
                                }
                            VStack {
                                Image("액자에_추억을_담아보자").padding(.top, -80)
                                HStack {
                                    Image("사진_찍기")
                                        .onTapGesture {
                                            isShowingCamera = true
                                            showCamera = true
                                            isClicked = false
                                        }
                                    
                                    Image("앨범에서_고르기").padding(.leading, 40)
                                        .onTapGesture {
                                            showImagePicker = true
                                            isClicked = false
                                        }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }.padding(.top, 40)
        }
        .fullScreenCover(isPresented: $isShowingCamera) {
            ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
        
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
        }
    }
    
    private func loadImage() {
        if let image = selectedImage {
            
        }
    }
    
    func openLibrary() {
        showImagePicker = true
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
    var sourceType: UIImagePickerController.SourceType
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedImage: $selectedImage)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var selectedImage: UIImage?
        
        init(selectedImage: Binding<UIImage?>) {
            _selectedImage = selectedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                selectedImage = image
            }
            
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct ToCameraView_Previews: PreviewProvider {
    static var previews: some View {
        ToCameraView()
    }
}
