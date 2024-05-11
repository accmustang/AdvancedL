//
//  ViewBuilderAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 11.05.2024.
//

import SwiftUI


struct HeaderView: View {
    
    let title: String
    let description: String?
    let iconName: String?
    var body: some View {
        VStack{
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
                    .font(.callout)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
}

struct HeaderViewCustom<Content:View>: View{
    let title: String
    let content: Content
    var body: some View{
        VStack{
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
    }
}
struct HeaderViewCustomParantezli<Content:View>: View{
    let title: String
    let content: Content
    init(title: String, @ViewBuilder content:()-> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View{
        VStack{
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
    }
}
struct ViewBuilderAL: View {
    var body: some View {
        
        HeaderView(title: "Test1 w/desc w/icon", description: "Descripton", iconName: "heart")
        HeaderView(title: "Test2 only title", description: nil, iconName: nil)
        HeaderViewCustom(title: "Test Custom", content: Text("Custom content 1"))
        HeaderViewCustomParantezli(title: "Test Parantezli") {
            Text("Örnek alt başlık1")
            Image(systemName: "star")

        }
    }
}

#Preview {
    ViewBuilderAL()
}
