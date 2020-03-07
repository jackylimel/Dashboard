//
//  LectureUseCaseSpec.swift
//  DashboardTests
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import XCTest
@testable import Dashboard

class LectureUseCaseSpec: XCTestCase {
    let calendar = Calendar.current
    let lectureUseCase = LectureUseCase(repo: StubRepository())

    func test_getLectures_should_return_sorted_lectures_later_than_given_time_with_given_count() {
        let components = DateComponents(year: 2019, month: 3, day: 3, hour: 7, minute: 0, second: 0)
        let baseTime = calendar.date(from: components)!

        let theExpectation = expectation(description: "usecase load data and runs callback")

        lectureUseCase.getLectures(limited: 5, laterThan: baseTime) { lectures in
            XCTAssertEqual(lectures.count, 4)
            XCTAssertEqual(lectures[0].start, "08:00")
            XCTAssertEqual(lectures[1].start, "09:00")
            XCTAssertEqual(lectures[2].start, "12:00")
            XCTAssertEqual(lectures[3].start, "15:00")
            theExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let error = error {
              XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func test_getLectures_should_not_return_lectures_early_than_given_time() {
        let components = DateComponents(year: 2019, month: 3, day: 3, hour: 11, minute: 0, second: 0)
        let baseTime = calendar.date(from: components)!

        let theExpectation = expectation(description: "usecase load data and runs callback")

        lectureUseCase.getLectures(limited: 5, laterThan: baseTime) { lectures in
            XCTAssertEqual(lectures.count, 2)
            XCTAssertEqual(lectures[0].start, "12:00")
            XCTAssertEqual(lectures[1].start, "15:00")
            theExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { error in
            if let error = error {
              XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
