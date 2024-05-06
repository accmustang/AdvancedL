//
//  ViewModifiersAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 6.05.2024.
//

import SwiftUI

extension View{
    func TemaButtonOrtakModifier(bgColor: Color) -> some View{
        self.modifier(TemaButtonV1ViewModifiers(bgColor: bgColor))
    }
}

struct TemaButtonV1ViewModifiers: ViewModifier{
    let bgColor : Color
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
    }
}
struct ViewModifiersAL: View {
    var body: some View {
        Text("Button")
            .font(.callout)
            .TemaButtonOrtakModifier(bgColor: .red)
        Text("Button")
            .font(.largeTitle)
            .TemaButtonOrtakModifier(bgColor: .blue)
        Text("Button")
            .TemaButtonOrtakModifier(bgColor: .purple)
        
    }
}

#Preview {
    ViewModifiersAL()
}
