//
//  LectureUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class LectureUseCase {
    private let repo = FirebaseRepository()
    
    private let lectures: [Lecture] = [
        Lecture(name: "FIT1031 Lecture 01", teacher: "Arun Kongaurthu", classroom: "S1, 13 Collage Walk, Clayton", start: "08:00", end: "10:00"),
        Lecture(name: "FIT1031 Lecture 02", teacher: "Arun Kongaurthu", classroom: "S2, 13 Collage Walk, Clayton", start: "09:00", end: "11:00"),
        Lecture(name: "FIT1031 Lecture 03", teacher: "Arun Kongaurthu", classroom: "S3, 13 Collage Walk, Clayton", start: "12:00", end: "14:00"),
        Lecture(name: "FIT1031 Lecture 04", teacher: "Arun Kongaurthu", classroom: "S4, 13 Collage Walk, Clayton", start: "15:00", end: "16:00")
    ]

    func getLectures(within minutes: Int) -> [Lecture] {
        return lectures
    }

    func getLectures(within minutes: Int, _ completion: @escaping ([Lecture]) -> Void) {
        do {
            try repo.getData(name: "lectures") { lectures in
                completion(lectures)
            }
        } catch {
            print(error)
        }
    }
}
