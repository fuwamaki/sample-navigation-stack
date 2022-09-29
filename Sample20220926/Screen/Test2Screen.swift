//
//  Test2Screen.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI

struct Test2Screen: View {
    @ObservedObject private var subject = Test2Subject()

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
                subject.segue(.test3(text: "test3: from test2"))
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
        }
        .navigationTitle("Test2Screen")
    }
}

struct Test2Screen_Previews: PreviewProvider {
    static var previews: some View {
        Test2Screen()
    }
}
