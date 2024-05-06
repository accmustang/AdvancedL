//
//  ButtonStyleAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 6.05.2024.
//

import SwiftUI

struct ButonTiklanmaStili: ButtonStyle{
    
    let scaleDegeri: CGFloat
    init(scaleDegeri: CGFloat) {
        self.scaleDegeri = scaleDegeri
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .foregroundColor(configuration.isPressed ? .red : .white)
            .scaleEffect(configuration.isPressed ? scaleDegeri : 1)
    }
}

extension View{
    func ViewButonTiklanmaStili() -> some View{
        self
            .buttonStyle(ButonTiklanmaStili(scaleDegeri: 0.4))
    }
}

struct ButtonStyleAL: View {
    var body: some View {
        
        Button(action: {}, label: {
            Text("Button")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: .purple, radius: 10, x:10, y:20)
                .padding(10)
        })
        .ViewButonTiklanmaStili()
        //.buttonStyle(ButonTiklanmaStili(scaleDegeri: 0.5 ))
        //.buttonStyle(DefaultButtonStyle())
    }
}

#Preview {
    ButtonStyleAL()
}
