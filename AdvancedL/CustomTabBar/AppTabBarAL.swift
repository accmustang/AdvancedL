//
//  AppTabBarAL.swift
//  AdvancedL
//
//  Created by serhatakyol on 13.05.2024.
//

import SwiftUI

struct AppTabBarAL: View {
    @State private var selection: String = "heart"
    @State private var tabSelection: TabBarItem = .home
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.purple
                .tabBarItem(tab: .favorites, selection: $tabSelection)

            Color.blue
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

extension AppTabBarAL{
    private var defaultTabBarView: some View{
        TabView(selection: $selection){
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
        }
    }
}

struct AppTabBarAL_Previews: PreviewProvider{
    static var previews: some View{
        AppTabBarAL()
    }
}
