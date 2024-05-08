//
//  CustomShapesAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 8.05.2024.
//

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}
struct Diamond: Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}
struct CustomShapesAL: View {
    var body: some View {
        HStack{
           Triangle()
                .frame(width: 100, height: 100)
            Diamond()
                 .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    CustomShapesAL()
}
