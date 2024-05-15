//
//  CustomNavBarView.swift
//  AdvancedL
//
//  Created by serhatakyol on 14.05.2024.
//

import SwiftUI

struct CustomNavBarView: View {
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subTitle: String?
    
    var body: some View {
        HStack{
            if showBackButton{
                backButton
            }
            
            titleSection
            .frame(maxWidth: .infinity)
            Spacer()
            if showBackButton{
                backButton
                .opacity(0)
            }
            
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(
            Color.blue
                .ignoresSafeArea(edges: .top)
        )
    }
}

extension CustomNavBarView{
    private var backButton: some View{
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    private var titleSection: some View{
        VStack(alignment:.center, spacing:4){
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subTitle = subTitle {
                Text(subTitle)
            }
        }
    }
}

#Preview {
    VStack{
        CustomNavBarView(showBackButton: true, title: "Title Here", subTitle: "Sub Title Here")
        Spacer()
    }
}
