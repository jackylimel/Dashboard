//
//  LectureUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class LectureUseCase {
    private let lectures: [Lecture] = [
        Lecture(name: "FIT1031 Lecture 01", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "08:00", end: "10:00"),
        Lecture(name: "FIT1031 Lecture 01", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "09:00", end: "11:00"),
        Lecture(name: "FIT1031 Lecture 01", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "12:00", end: "14:00"),
        Lecture(name: "FIT1031 Lecture 01", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "15:00", end: "16:00")
    ]

    func getLectures(within minutes: Int) -> [Lecture] {
        return lectures
    }
}
