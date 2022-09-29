//
//  MainTabScreen.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/27.
//

import SwiftUI
import Combine

struct MainTabScreen: View {
    @ObservedObject private var subject = MainTabSubject()

    var body: some View {
        TabView(selection: $subject.tabType) {
            LeftScreen()
                .tabItem {
                    Image(systemName: "a.circle")
                    Text("left")
                }
                .tag(MainTabType.left)
            CenterScreen()
                .tabItem {
                    Image(systemName: "b.circle")
                    Text("center")
                }
                .tag(MainTabType.center)
            RightScreen()
                .tabItem {
                    Image(systemName: "c.circle")
                    Text("right")
                }
                .tag(MainTabType.right)
        }
        .onChange(of: subject.tabType) {
            subject.changeTabType($0)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabScreen()
    }
}
