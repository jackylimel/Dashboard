//
//  LectureUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class LectureUseCase {
    private let repo: Repository

    init(repo: Repository) {
        self.repo = repo
    }
    
    func getLectures(limited by: Int, laterThan time: Date = Date(), completion: @escaping ([Lecture]) -> Void) {
        do {
            try repo.getData(name: FirebaseCollection.lectures) { [unowned self] lectures in
                completion(self.filter(lectures: lectures, limited: by, laterThan: time))
            }
        } catch {
            print(error)
        }
    }

    private func filter(lectures: [Lecture], limited by: Int, laterThan time: Date) -> [Lecture] {
        let result = lectures.filter { lecture in
            return lecture.startMinutesFrom(baseTime: time) > 0
        }.sorted(by: { a, b in
            return a.start < b.start
        }).prefix(by)

        return Array(result)
    }
}
