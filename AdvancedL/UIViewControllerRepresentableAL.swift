//
//  UIViewControllerRepresentableAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 25.05.2024.
//

import SwiftUI

struct UIViewControllerRepresentableAL: View {
    @State private var image: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View{
        VStack{
            Button(action: {
                isShowingImagePicker.toggle()
            }, label: {
                VStack{
                    if let image = image{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    Text("Select Image")
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.2))
                        .padding()
                }
            })
            .sheet(isPresented: $isShowingImagePicker) {
                UIImagePickerControllerRepresentable(image: $image, isShowingImagePicker: $isShowingImagePicker)
                    .ignoresSafeArea()
            }
            
        }
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    @Binding var image: UIImage? // Seçilen görüntüyü tutmak için Binding değişkeni
    @Binding var isShowingImagePicker: Bool // ImagePicker'ın gösterilip gösterilmeyeceğini kontrol eden Binding değişkeni
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIImagePickerController() // UIImagePickerController örneği oluşturuluyor
        vc.allowsEditing = false // Resim düzenlemeye izin verme
        vc.delegate = context.coordinator // Delegate olarak Coordinator atanıyor
        
        return vc // Picker döndürülüyor
    }
    
    // SwiftUI'dan UIKit'e veri güncelleme fonksiyonu
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    // UIKit'ten SwiftUI'a veri güncelleme fonksiyonu
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, isShowingImagePicker: $isShowingImagePicker) // Coordinator oluşturuluyor
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: UIImage? // Seçilen görüntüyü tutmak için Binding değişkeni
        @Binding var isShowingImagePicker: Bool // ImagePicker'ın gösterilip gösterilmeyeceğini kontrol eden Binding değişkeni
        
        init(image: Binding<UIImage?>, isShowingImagePicker: Binding<Bool>) {
            self._image = image // Image binding değişkeni atanıyor
            self._isShowingImagePicker = isShowingImagePicker // ImagePicker gösterim durumu atanıyor
        }
        
        // Kullanıcı bir resim seçtiğinde çağrılır
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return } // Seçilen resim kontrol edilir ve alınır
            image = newImage // Seçilen resim image binding değişkenine atanır
            isShowingImagePicker = false // ImagePicker kapatılır
        }
    }
}


#Preview {
    UIViewControllerRepresentableAL()
}
