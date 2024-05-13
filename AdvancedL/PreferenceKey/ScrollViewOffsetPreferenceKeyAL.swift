//
//  ScrollViewOffsetPreferenceKeyAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 13.05.2024.
//

import SwiftUI


//3. PreferenceKey oluşturma. Scrollview float verdiğinden CGFloat olarak tanımlıyoruz.
struct ScrollViewOffsetPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
struct ScrollViewOffsetPreferenceKeyAL: View {
    //1. Değişkenleri tanımla.
    let title: String = "Custom Title"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView{
            VStack{
                titleLayer
                    .opacity(Double(scrollViewOffset) / 75 ) //75 bizim büyük başlığın yüksekliği
                    .background(
                        GeometryReader{ geometry in
                            Text("")
                                .preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                                //4.PreferenceKeyimizi çağırıyoruz ve geo dan gelen frame değerini atıyoruz
                        }
                    )
                contentLayer
            }
            .padding()
        }
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
            scrollViewOffset = value //5. Keyden gelen değişikliği kontrol edip değişkenimize değeri atıyoruz.
        })
        .overlay{
            Text("\(scrollViewOffset)")
        }
        .overlay(
                navBarLayer
                    .transition(.opacity)
                    .opacity(Double(scrollViewOffset) < 40 ? 1.0 : 0.0) //6. Scroll büyük başlığın yarısına geldiğinde küçük başlığın opaklığını açıyoruz.
                ,alignment: .top)
    }
}

//2. Ekrandaki kısımları partlara ayırma.
extension ScrollViewOffsetPreferenceKeyAL{
    //2.1 Büyük başlık kısmı
    private var titleLayer: some View{
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    //2.2 Rectangle kısmı
    private var contentLayer: some View{
        ForEach(0..<100){ _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    //2.3 küçük başlık kısmı
    private var navBarLayer: some View{
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}

#Preview {
    ScrollViewOffsetPreferenceKeyAL()
}
