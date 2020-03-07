//
//  ShuttleBusUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class ShuttleBusUseCase {
    private let repo = FirebaseRepository()

    func getBuses(limited by: Int, completion: @escaping ([ShuttleBus]) -> Void) {
        do {
            try repo.getData(name: FirebaseCollection.shuttleBuses) { buses in
                completion(self.filter(buses: buses, limited: by))
            }
        } catch {
            print(error)
        }
    }

    private func filter(buses: [ShuttleBus], limited by: Int) -> [ShuttleBus] {
        let result = buses.filter { bus in
            return bus.minutesForNow > 0
        }.sorted(by: { a, b in
            return a.time < b.time
        }).prefix(by)

        return Array(result)
    }
}
