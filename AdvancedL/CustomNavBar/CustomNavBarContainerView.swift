//
//  CustomNavBarContainerView.swift
//  AdvancedL
//
//  Created by serhatakyol on 14.05.2024.
//

import SwiftUI

struct CustomNavBarContainerView<Content:View>: View {
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    init(@ViewBuilder content: ()-> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing:0){
            CustomNavBarView(showBackButton: showBackButton, title: title, subTitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubTitlePreferenceKey.self, perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarShowBackButtonPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack{
            Color.green.ignoresSafeArea()
            Text("sa")
                .customNavigationTitle("New Title")
                .customNavigationSubTitle("Sub Title")
                .customNavigationBackButtonHidden(false)
        }
        
    }
}
