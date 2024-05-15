//
//  CustomNavBarReferenceKeys.swift
//  AdvancedL
//
//  Created by serhatakyol on 14.05.2024.
//

import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey{
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubTitlePreferenceKey: PreferenceKey{
    static var defaultValue: String? = nil
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}


struct CustomNavBarShowBackButtonPreferenceKey: PreferenceKey{
    static var defaultValue: Bool = false
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View{
    func customNavigationTitle(_ title: String) -> some View{
        self
            .preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    func customNavigationSubTitle(_ subTitle: String?) -> some View{
        self
            .preference(key: CustomNavBarSubTitlePreferenceKey.self, value: subTitle)
    }
    func customNavigationBackButtonHidden(_ hidden: Bool) -> some View{
        self
            .preference(key: CustomNavBarShowBackButtonPreferenceKey.self, value: hidden)
    }
    
    func customNavBarItems(title: String = "", subTitle: String? = nil, backButtonHidden: Bool = false)-> some View{
        self
            .customNavigationTitle(title)
            .customNavigationSubTitle(subTitle)
            .customNavigationBackButtonHidden(backButtonHidden)
    }
}
