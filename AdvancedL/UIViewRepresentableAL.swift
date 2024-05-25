//
//  UIViewRepresentableAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 25.05.2024.
//

import SwiftUI

struct UIViewRepresentableAL: View {
    @State private var text: String = "Bu Yazı TextField Değiştiğinde değişecek"

    var body: some View {
        VStack{
            //BasitUIViewRepresentable
            
            Text("\(text)")
            Color.gray
                .frame(height: 1)
                .padding(.vertical,50)
            Text("TextField")
            TextField("Buraya yaz..", text: $text)
                .frame(height: 55)
                .padding(5)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.2))
                .padding()
            
            Color.gray
                .frame(height: 1)
                .padding(.vertical,50)
            
            Text("UITextFieldViewRepresentable")
            UITextFieldViewRepresentable(text: $text, placeHolder: "Buraya yazı girilecek..", placeHolderColor: .red)
                .frame(height: 55)
                .padding(5)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.2))
                .padding()
                
        }
    }
    
    
}

#Preview {
    UIViewRepresentableAL()
}

struct UITextFieldViewRepresentable: UIViewRepresentable{
    
    @Binding var text: String
    let placeHolder: String
    let placeHolderColor: UIColor
    
    func makeUIView(context: Context) ->  UITextField {
        let textfield = getTextField()
        textfield.delegate  = context.coordinator
        
        return textfield
    }
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField()-> UITextField{
        let textField = UITextField()
        let placeHolder = NSAttributedString(
            string: placeHolder,
            attributes: [
                .foregroundColor : placeHolderColor
            ]
        )
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    
    func makeCoordinator()-> Coordinator{
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate{
        @Binding var text: String
        
        init(text: Binding<String>){
            self._text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct BasitUIViewRepresentable: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
