//
//  Test1Screen.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI

struct Test1Screen: View {
    @ObservedObject private var subject = Test1Subject()

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
                subject.segue(.test3(text: "test3: from test1"))
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
        .navigationTitle("Test1Screen")
    }
}

struct Test1Screen_Previews: PreviewProvider {
    static var previews: some View {
        Test1Screen()
    }
}
