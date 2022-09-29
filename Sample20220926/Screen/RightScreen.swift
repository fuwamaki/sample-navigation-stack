//
//  RightScreen.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI

struct RightScreen: View {
    @ObservedObject private var subject = RightSubject()

    var text: AttributedString {
        var message = "test「てすと」"
        if let match = message.firstMatch(of: /「(.*)」/) {
            message = message.replacing(/「(.*)」/, with: " **\(match.0)** ")
        }
        return (try? AttributedString(markdown: message)) ?? AttributedString()
    }

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
                    subject.segue(.test3(text: "test3: from right"))
                } label: {
                    Text("Test3へ")
                }
                .foregroundColor(.primary)
                Text(text)
            }
            .navigationTitle("Right")
            .customNavigation()
        }
    }
}
