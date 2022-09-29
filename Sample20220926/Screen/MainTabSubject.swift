//
//  MainTabSubject.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import Combine

class MainTabSubject: ObservableObject {
    @Published var tabType: MainTabType = .center

    private let cacheStore: CacheStore
    private var cancellables = Set<AnyCancellable>()

    init(cacheStore: CacheStore = CacheStore.shared) {
        self.cacheStore = cacheStore
        receivedTabType
            .assign(to: \.tabType, on: self)
            .store(in: &cancellables)
    }

    var receivedTabType: AnyPublisher<MainTabType, Never> {
        cacheStore.tabType
    }

    func changeTabType(_ tabType: MainTabType) {
        cacheStore.changeTabType(tabType)
    }
}
