//
//  String+Time.swift
//  Dashboard
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

typealias HourAndMinute = (Int, Int)

extension String {
    // convert the String format of "hh:mm" to the format of (hh, mm)
    func timeInHourAndMinute() -> HourAndMinute {
        let array = self.split(separator: ":")
        let hour = String(array[0])
        let minute = String(array[1])
        return (Int(hour) ?? 0, Int(minute) ?? 0)
    }
}
