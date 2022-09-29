//
//  Test1Subject.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import Combine

class Test1Subject: ObservableObject {
    private let cacheStore: CacheStore
    private var cancellables = Set<AnyCancellable>()

    init(cacheStore: CacheStore = CacheStore.shared) {
        self.cacheStore = cacheStore
    }

    func segue(_ routerType: RouterType) {
        cacheStore.segue(routerType)
    }

    func resetSegue() {
        cacheStore.reset()
    }
}
