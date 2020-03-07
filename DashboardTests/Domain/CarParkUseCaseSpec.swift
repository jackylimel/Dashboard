//
//  CarParkUseCaseSpec.swift
//  DashboardTests
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import XCTest
@testable import Dashboard

class CarParkUseCaseSpec: XCTestCase {
    let carParkUseCase = CarParkUseCase(repo: StubRepository())

    func test_getCarParks_should_return_sorted_carParks_with_given_count() {
        let theExpectation = expectation(description: "usecase load data and runs callback")

        carParkUseCase.getCarParks(limited: 2) { carParks in
            XCTAssertEqual(carParks.count, 2)
            XCTAssertEqual(carParks[0].availableCount, 454)
            XCTAssertEqual(carParks[0].name, "Clayton Live Feed 2")

            XCTAssertEqual(carParks[1].availableCount, 456)
            XCTAssertEqual(carParks[1].name, "Clayton Live Feed")

            theExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let error = error {
              XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
