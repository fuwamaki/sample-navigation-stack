//
//  ContentView.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/26.
//

import SwiftUI

struct ContentView: View {
    @State var isStart: Bool = false

    var body: some View {
        VStack {
            if isStart {
                MainTabScreen()
            } else {
                TopView(isStart: $isStart)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
