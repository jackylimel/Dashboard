//
//  StubRepository.swift
//  DashboardTests
//
//  Created by Jacky Li on 7/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import XCTest
@testable import Dashboard

class StubRepository: Repository {

    private let carParks: [CarPark] = [
        CarPark(name: "Clayton Live Feed", availableCount: 456),
        CarPark(name: "Clayton Live Feed 2", availableCount: 454),
        CarPark(name: "Clayton Live Feed 3", availableCount: 457)
    ]

    private let buses: [ShuttleBus] = [
        ShuttleBus(from: "Clayton", to: "Caulfield", time: "16:00"),
        ShuttleBus(from: "Clayton", to: "Mornington", time: "16:30"),
        ShuttleBus(from: "Clayton", to: "Peninsula", time: "16:15"),
    ]

    private let lectures: [Lecture] = [
        Lecture(name: "FIT1031 Lecture 04", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "15:00", end: "16:00"),
        Lecture(name: "FIT1031 Lecture 01", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "08:00", end: "10:00"),
        Lecture(name: "FIT1031 Lecture 03", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "12:00", end: "14:00"),
        Lecture(name: "FIT1031 Lecture 02", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "09:00", end: "11:00")
    ]
    
    func getData<T>(name: FirebaseCollection, _ completion: @escaping ([T]) -> Void) throws where T : Codable {
        switch T.self {
        case is CarPark.Type: completion(carParks as! [T])
        case is ShuttleBus.Type: completion(buses as! [T])
        case is Lecture.Type: completion(lectures as! [T])
        default: return
        }
    }
}
