//
//  CarParkUseCase.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation

class CarParkUseCase {
    private let repo = FirebaseRepository()

    func getCarParks(limited by: Int, completion: @escaping ([CarPark]) -> Void) {
        do {
            try repo.getData(name: FirebaseCollection.carParks) { [unowned self] carParks in
                completion(self.filter(carParks: carParks, limited: by))
            }
        } catch {
            print(error)
        }
    }

    private func filter(carParks: [CarPark], limited by: Int) -> [CarPark] {
        let result = carParks.sorted(by: { a, b in
            return a.availableCount < b.availableCount
        }).prefix(by)

        return Array(result)
    }
}
