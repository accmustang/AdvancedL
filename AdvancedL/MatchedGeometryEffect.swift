//
//  MatchedGeometryEffect.swift
//  AdvancedL
//
//  Created by serhatakyol on 8.05.2024.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack{
            if !isClicked{
                RoundedRectangle(cornerRadius: 20.0)
                    .matchedGeometryEffect(id: "kare", in: namespace)
                    .frame(width: 100, height: 100)
            }
            Spacer()
            if isClicked{
                RoundedRectangle(cornerRadius: 100.0)
                    .matchedGeometryEffect(id: "kare", in: namespace)
                    .frame(width: 300, height: 400)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut){
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffect2: View{
    let categories: [String] = ["Anasayfa", "Beğendiklerim", "Favoriler"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    var body: some View{
        HStack{
            ForEach(categories, id: \.self){ category in
                ZStack{
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "kategori_adi", in: namespace2)
                    }
                    Text(category)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        selected = category
                    }
                }
            }
        }
    }
}

#Preview {
    MatchedGeometryEffect2()
}
