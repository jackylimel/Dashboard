//
//  ShuttleBusUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class ShuttleBusUseCase {
    private let repo: Repository

    init(repo: Repository) {
        self.repo = repo
    }

    func getBuses(limited by: Int, laterThan time: Date = Date(), completion: @escaping ([ShuttleBus]) -> Void) {
        do {
            try repo.getData(name: FirebaseCollection.shuttleBuses) { buses in
                completion(self.filter(buses: buses, limited: by, laterThan: time))
            }
        } catch {
            print(error)
        }
    }

    private func filter(buses: [ShuttleBus], limited by: Int, laterThan time: Date) -> [ShuttleBus] {
        let result = buses.filter { bus in
            return bus.minutesFrom(baseTime: time) > 0
        }.sorted(by: { a, b in
            return a.time < b.time
        }).prefix(by)

        return Array(result)
    }
}
