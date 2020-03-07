//
//  StringExtensionSpec.swift
//  DashboardTests
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import XCTest
@testable import Dashboard

class StringExtensionSpec: XCTestCase {
    func test_should_convert_to_hour_and_minute_format_when_hour_less_than_10() {
        let time = "08:12"
        XCTAssertEqual(8, time.timeInHourAndMinute().0)
        XCTAssertEqual(12, time.timeInHourAndMinute().1)
    }

    func test_should_convert_to_hour_and_minute_format_when_hour_more_than_10() {
        let time = "12:23"
        XCTAssertEqual(12, time.timeInHourAndMinute().0)
        XCTAssertEqual(23, time.timeInHourAndMinute().1)
    }
}
