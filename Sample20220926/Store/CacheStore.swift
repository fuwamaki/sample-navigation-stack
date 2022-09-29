//
//  CacheStore.swift
//  Sample20220926
//
//  Created by yusaku maki on 2022/09/28.
//

import SwiftUI
import Combine

class CacheStore {
    static let shared = CacheStore()
    @AppStorage("local_string") private var localString: String = ""

    init() {
        _localStringPublisher.send(localString)
    }

    // MARK: Singleton variable
    private let _tabType = CurrentValueSubject<MainTabType, Never>(.center)
    var tabType: AnyPublisher<MainTabType, Never> {
        _tabType.removeDuplicates().eraseToAnyPublisher()
    }

    private let _leftTabRouterPath = CurrentValueSubject<[RouterType], Never>([])
    var leftTabRouterPath: AnyPublisher<[RouterType], Never> {
        _leftTabRouterPath.eraseToAnyPublisher()
    }

    private let _centerTabRouterPath = CurrentValueSubject<[RouterType], Never>([])
    var centerTabRouterPath: AnyPublisher<[RouterType], Never> {
        _centerTabRouterPath.eraseToAnyPublisher()
    }

    private let _rightTabRouterPath = CurrentValueSubject<[RouterType], Never>([])
    var rightTabRouterPath: AnyPublisher<[RouterType], Never> {
        _rightTabRouterPath.eraseToAnyPublisher()
    }

    // MARK: AppStorage variable
    private let _localStringPublisher = CurrentValueSubject<String, Never>("")
    var localStringPublisher: AnyPublisher<String, Never> {
        _localStringPublisher.removeDuplicates().eraseToAnyPublisher()
    }
}

// MARK: AppStorage functions
extension CacheStore {
    func sendLocalString(_ string: String) {
        Task { @MainActor in
            _localStringPublisher.send(string)
            localString = string
        }
    }
}

// MARK: Singleton functions
extension CacheStore {
    func changeTabType(_ tabType: MainTabType) {
        Task { @MainActor in
            self._tabType.send(tabType)
        }
    }

    func segue(_ routerType: RouterType) {
        Task { @MainActor in
            switch self._tabType.value {
            case .left:
                self._leftTabRouterPath
                    .send(self._leftTabRouterPath.value + [routerType])
            case .center:
                self._centerTabRouterPath
                    .send(self._centerTabRouterPath.value + [routerType])
            case .right:
                self._rightTabRouterPath
                    .send(self._rightTabRouterPath.value + [routerType])
            }
        }
    }

    func updateLeftTabRouterPath(_ path: [RouterType]) {
        guard self._leftTabRouterPath.value != path else { return }
        self._leftTabRouterPath.send(path)
    }

    func updateCenterTabRouterPath(_ path: [RouterType]) {
        guard self._centerTabRouterPath.value != path else { return }
        self._centerTabRouterPath.send(path)
    }

    func updateRightTabRouterPath(_ path: [RouterType]) {
        guard self._rightTabRouterPath.value != path else { return }
        self._rightTabRouterPath.send(path)
    }

    func reset() {
        Task { @MainActor in
            switch self._tabType.value {
            case .left:
                self._leftTabRouterPath.send([])
            case .center:
                self._centerTabRouterPath.send([])
            case .right:
                self._rightTabRouterPath.send([])
            }
        }
    }
}
