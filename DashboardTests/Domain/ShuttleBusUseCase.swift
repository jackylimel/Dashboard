//
//  ShuttleBusUseCase.swift
//  DashboardTests
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import XCTest
@testable import Dashboard

class ShuttleBusUseCaseSpec: XCTestCase {
    let calendar = Calendar.current
    let shuttleBusUseCase = ShuttleBusUseCase(repo: StubRepository())

    func test_getShuttleBuses_should_return_sorted_buses_later_than_given_time_with_given_count() {
        let components = DateComponents(year: 2019, month: 3, day: 3, hour: 15, minute: 40, second: 0)
        let baseTime = calendar.date(from: components)!

        let theExpectation = expectation(description: "usecase load data and runs callback")

        shuttleBusUseCase.getBuses(limited: 3, laterThan: baseTime) { buses in
            XCTAssertEqual(buses.count, 3)
            XCTAssertEqual(buses[0].time, "16:00")
            XCTAssertEqual(buses[1].time, "16:15")
            XCTAssertEqual(buses[2].time, "16:30")
            theExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let error = error {
              XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func test_getShuttleBuses_should_not_return_buses_early_than_given_time() {
        let components = DateComponents(year: 2019, month: 3, day: 3, hour: 16, minute: 16, second: 0)
        let baseTime = calendar.date(from: components)!

        let theExpectation = expectation(description: "usecase load data and runs callback")

        shuttleBusUseCase.getBuses(limited: 3, laterThan: baseTime) { buses in
            XCTAssertEqual(buses.count, 1)
            XCTAssertEqual(buses[0].time, "16:30")
            theExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let error = error {
              XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
