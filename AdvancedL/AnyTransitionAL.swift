//
//  AnyTransitionAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 6.05.2024.
//

import SwiftUI

struct RotateViewModifiers: ViewModifier{
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .transition(.rotating)
    }
}
extension AnyTransition{
    static var rotating: AnyTransition{
        return AnyTransition.modifier(
            active: RotateViewModifiers(rotation: 180),
            identity: RotateViewModifiers(rotation: 0)
        ).animation(.bouncy)
    }
    
    static func customRotating(rotating: Double) -> AnyTransition{
        return AnyTransition.modifier(
            active: RotateViewModifiers(rotation: rotating),
            identity: RotateViewModifiers(rotation: 0)
        )
    }
}
struct AnyTransitionAL: View {
    
    @State private var showRectangle: Bool = true
    var body: some View {
        
        VStack{
            Spacer()
            
            if showRectangle{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //.modifier(RotateViewModifiers(rotation: 30))
                    //.transition(AnyTransition.rotating)
                    //.transition(.rotating)
                    //.transition(.customRotating(rotating: 90))

            }
            Spacer()
            Text("Toggle Rectangle")
                .TemaButtonOrtakModifier(bgColor: .red )
                .onTapGesture {
                    withAnimation(.easeInOut){
                        showRectangle.toggle()
                    }
                }
            
            
        }
    }
}

#Preview {
    AnyTransitionAL()
}
