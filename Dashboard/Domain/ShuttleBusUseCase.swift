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
    private let buses: [ShuttleBus] = [
        ShuttleBus(from: "Clayton", to: "Caulfield", time: "16:00"),
        ShuttleBus(from: "Clayton", to: "Peninsula", time: "16:16"),
        ShuttleBus(from: "Clayton", to: "Mornington", time: "16:30"),
    ]

    func getBuses(within minutes: Int) -> [ShuttleBus] {
        return buses
    }

    func getBuses(within minutes: Int, _ completion: @escaping ([ShuttleBus]) -> Void) {
        do {
            try repo.getData(name: "shuttleBuses") { buses in
                completion(buses)
            }
        } catch {
            print(error)
        }
    }
}
