//
//  Calendar+Difference.swift
//  Dashboard
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

extension Calendar {
    func minutes(from now: Date, to time: HourAndMinute) -> Int {
        let nowComponents = self.dateComponents([.day, .hour, .minute], from: now)
        let dateToCompare = self.date(bySettingHour: time.0, minute: time.1, second: 0, of: now)
        let dateComponents = self.dateComponents([.day, .hour, .minute], from: dateToCompare ?? now)
        return self.dateComponents([.minute], from: nowComponents, to: dateComponents).minute ?? 0
    }
}
