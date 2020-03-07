//
//  ShuttleBus.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

struct ShuttleBus: Codable {
    let from: String
    let to: String
    let time: String

    func minutesFrom(baseTime: Date = Date()) -> Int {
        Calendar.current.minutes(from: baseTime, to: time.timeInHourAndMinute())
    }
}
