//
//  Test3Screen.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI

struct Test3Screen: View {
    @ObservedObject private var subject: Test3Subject

    init(text: String) {
        subject = Test3Subject(text: text)
    }

    var body: some View {
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
                subject.segue(.test3(text: "test3: from test3"))
            } label: {
                Text("Test3へ")
            }
            .foregroundColor(.primary)
            Button {
                subject.resetSegue()
            } label: {
                Text("ResetSegue")
            }
            .foregroundColor(.primary)
            Button {
                subject.updateLocalString("abc")
            } label: {
                Text("memoをabcに")
            }
            .foregroundColor(.primary)
            Button {
                subject.updateLocalString("def")
            } label: {
                Text("memoをdefに")
            }
            .foregroundColor(.primary)
            Text("memo: \(subject.localString)")
        }
        .navigationTitle(subject.title)
    }
}

struct Test3Screen_Previews: PreviewProvider {
    static var previews: some View {
        Test3Screen(text: "text")
    }
}
