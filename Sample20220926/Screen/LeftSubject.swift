//
//  LeftSubject.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import Combine

class LeftSubject: ObservableObject {
    @Published var path: [RouterType] = []

    private let cacheStore: CacheStore
    private var cancellables = Set<AnyCancellable>()

    init(cacheStore: CacheStore = CacheStore.shared) {
        self.cacheStore = cacheStore
        self.cacheStore.leftTabRouterPath
            .assign(to: \.path, on: self)
            .store(in: &cancellables)
        $path
            .sink { self.cacheStore.updateLeftTabRouterPath($0) }
            .store(in: &cancellables)
    }

    func segue(_ routerType: RouterType) {
        cacheStore.segue(routerType)
    }
}
