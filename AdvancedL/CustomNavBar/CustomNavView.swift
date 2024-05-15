//
//  CustomNavView.swift
//  AdvancedL
//
//  Created by serhatakyol on 14.05.2024.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
    let content: Content
    
    init(@ViewBuilder content:()-> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView{
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
    }
}

extension UINavigationController{
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}
