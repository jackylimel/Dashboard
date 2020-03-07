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
    
    func getLectures(limited by: Int, completion: @escaping ([Lecture]) -> Void) {
        do {
            try repo.getData(name: FirebaseCollection.lectures) { [unowned self] lectures in
                completion(self.filter(lectures: lectures, limited: by))
            }
        } catch {
            print(error)
        }
    }

    private func filter(lectures: [Lecture], limited by: Int) -> [Lecture] {
        let result = lectures.filter { lecture in
            return lecture.startMinutesForNow > 0
        }.sorted(by: { a, b in
            return a.start < b.start
        }).prefix(by)

        return Array(result)
    }
}
