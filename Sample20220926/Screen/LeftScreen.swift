//
//  LeftScreen.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI

struct LeftScreen: View {
    @ObservedObject private var subject = LeftSubject()

    var body: some View {
        NavigationStack(path: $subject.path) {
            List {
                Button {
                    subject.segue(.test1)
                } label: {
                    Text("Test1へ")
                }
                .foregroundColor(.primary)
                Button {
                    subject.segue(.test2)
                } label: {
                    Text("Test2へ")
                }
                .foregroundColor(.primary)
                Button {
                    subject.segue(.test3(text: "test3: from left"))
                } label: {
                    Text("Test3へ")
                }
                .foregroundColor(.primary)
            }
            .navigationTitle("Left")
            .customNavigation()
        }
    }
}
