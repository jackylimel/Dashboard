//
//  Lecture.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

struct Lecture: Codable {
    let name: String
    let teacher: String
    let classroom: String
    let start: String
    let end: String

    func startMinutesFrom(baseTime: Date = Date()) -> Int {
        Calendar.current.minutes(from: baseTime, to: start.timeInHourAndMinute())
    }

    var startPeriod: String {
        return period(of: start)
    }

    var endPeriod: String {
        return period(of: end)
    }

    private func period(of time: String) -> String {
        let hour = time.timeInHourAndMinute()
        if hour.0 < 12 {
            return "AM"
        }
        return "PM"
    }
}
