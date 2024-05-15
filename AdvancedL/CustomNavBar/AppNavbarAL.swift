//
//  AppNavbarAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 14.05.2024.
//

import SwiftUI

struct AppNavbarAL: View {
    var body: some View {
        
        CustomNavView {
            ZStack{
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(
                    destination: Text("Destination")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubTitle("Second screen sub title")
                ) {
                    Text("Navigate")
                }
            }
            .customNavigationTitle("Custom Title")
            .customNavigationSubTitle("Custom Sub Title")
            .customNavigationBackButtonHidden(true)
        }
    }
}

extension AppNavbarAL{
    private var defaultNavView: some View{
        NavigationView{
            ZStack{
                Color.purple.opacity(0.2).ignoresSafeArea()
                
                NavigationLink(
                    destination:
                        Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                    ,
                    label: {
                        Text("Navigate")
                    }
                )
            }
            .navigationTitle("Nav Title")
        }
    }
}
#Preview {
    AppNavbarAL()
}
