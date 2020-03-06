//
//  FirebaseRepository.swift
//  Dashboard
//
//  Created by Jacky Li on 6/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation
import Firebase

class FirebaseRepository {
    let database = Firestore.firestore()
    let decoder = JSONDecoder()

    func getData<T>(name: String, _ completion: @escaping ([T]) -> Void) throws where T: Codable {
        database.collection(name).getDocuments { snapshot, error in
            let lectures = snapshot?.documents.compactMap { [unowned self] (doc) -> T? in
                guard let data = try? JSONSerialization.data(withJSONObject: doc.data(), options: []),
                    let result = try? self.decoder.decode(T.self, from: data) else {
                        return nil
                }
                return result
            }
            completion(lectures ?? [])
        }
    }
}
