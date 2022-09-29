//
//  Test3Subject.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI
import Combine

class Test3Subject: ObservableObject {
    @Published var title: String
    @Published var localString: String = ""

    private let cacheStore: CacheStore
    private var cancellables = Set<AnyCancellable>()

    init(
        text: String,
        cacheStore: CacheStore = CacheStore.shared
    ) {
        self.title = text
        self.cacheStore = cacheStore
        receivedLocalString
            .assign(to: \.localString, on: self)
            .store(in: &cancellables)
    }

    var receivedLocalString: AnyPublisher<String, Never> {
        cacheStore.localStringPublisher
    }

    func updateLocalString(_ string: String) {
        cacheStore.sendLocalString(string)
    }

    func segue(_ routerType: RouterType) {
        cacheStore.segue(routerType)
    }

    func resetSegue() {
        cacheStore.reset()
    }
}
