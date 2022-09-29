//
//  TopView.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/27.
//

import SwiftUI

struct TopView: View {
    @Binding var isStart: Bool

    var body: some View {
        VStack {
            Button("Hello, World!") {
                isStart.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}
