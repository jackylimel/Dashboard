//
//  CalendarExtensionSpec.swift
//  CalendarExtensionSpec
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import XCTest
@testable import Dashboard

class CalendarExtensionSpec: XCTestCase {
    let calendar = Calendar.current

    func test_should_calculate_difference_within_an_hour() {
        let date = setupBaseDate()
        XCTAssertEqual(calendar.minutes(from: date, to: (9, 20)), 10)
    }

    func test_should_calculate_difference_when_the_difference_is_more_than_an_hour() {
        let date = setupBaseDate()
        XCTAssertEqual(calendar.minutes(from: date, to: (10, 20)), 70)
    }

    func test_should_calculate_difference_when_the_compared_time_is_earlier_than_base_time() {
        let date = setupBaseDate()
        XCTAssertEqual(calendar.minutes(from: date, to: (8, 20)), -50)
    }

    private func setupBaseDate() -> Date {
        let components = DateComponents(year: 2019, month: 3, day: 3, hour: 9, minute: 10, second: 0)
        return calendar.date(from: components)!
    }
}
