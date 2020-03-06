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
