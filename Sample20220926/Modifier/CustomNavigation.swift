//
//  CustomNavigation.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI

struct CustomNavigation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: RouterType.self) { type in
                switch type {
                case .test1:
                    Test1Screen()
                case .test2:
                    Test2Screen()
                case .test3(let text):
                    Test3Screen(text: text)
                }
            }
    }
}
