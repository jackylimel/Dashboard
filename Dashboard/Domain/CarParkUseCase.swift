//
//  CarParkUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class CarParkUseCase {
    private let carParks: [CarPark] = [
        CarPark(name: "Clayton Live Feed", availableCount: 456),
        CarPark(name: "Clayton Live Feed 2", availableCount: 457)
    ]

    func getCarParks() -> [CarPark] {
        return carParks
    }
}
