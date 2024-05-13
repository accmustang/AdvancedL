//
//  PreferenceKeyAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 12.05.2024.
//

import SwiftUI

struct GeometryPreferenceKeyAL: View {
    
    //1. Adım, değişkeni oluştur.
    @State private var rectSize: CGSize = .zero
    var body: some View {
        VStack{
            Text("hELLO WOLRD")
                //5. Gelen size değerlerini Text nesnesine atıyoruz.
                .frame(width: rectSize.width,height: rectSize.height)
                .background(.blue)
            
            Spacer()
            HStack{
                Rectangle()

                GeometryReader(content: { geometry in
                    Rectangle()
                        //4. Adım oluşturduğumuz modifiere size değerlerini gönderiyoruz.
                        .updateRectSize(geometry.size)
                        
                })
                Rectangle()
                
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectanglePreferenceKey.self, perform:{ value in
            rectSize = value
        })
    }
  
}

//2. Adım PreferenceKeyimizi oluşturuyoruz.
struct RectanglePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

//3. Modifier oluşturup PreferenceKeyimize atamak için ayarlar yapıyoruz
extension View{
    func updateRectSize(_ size: CGSize) -> some View {
        self.preference(key:RectanglePreferenceKey.self, value: size)
    }
}

#Preview {
    GeometryPreferenceKeyAL()
}
