//
//  ServiceHolder.swift
//  ALKit
//
//  Created by Martin Pinka on 02.11.16.
//

import Foundation

public class ServiceHolder {

    // MARK: - Properties

    private var servicesDictionary: [String: Service] = [:]

    // MARK: - Initialization

    public init() {
    }

    // MARK: - Actions

    public func add<T>(_ type: T.Type, with name: String? = nil, constructor: () -> Service) {
        self.add(type, for: constructor(), with: name)
    }

    private func add<T>(_ protocolType: T.Type, for instance: Service, with name: String? = nil) {
        let name = name ?? String(reflecting: protocolType)
        servicesDictionary[name] = instance
    }

    public func get<T>(by type: T.Type = T.self) -> T {
        return get(by: String(reflecting: type))
    }

    private func get<T>(by name: String) -> T {
        guard let service = servicesDictionary[name] as? T else {
            fatalError("You have to add \(name) to a service holder.")
        }
        return service
    }
}
