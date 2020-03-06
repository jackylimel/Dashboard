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
