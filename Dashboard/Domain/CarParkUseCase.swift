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

    func getCarParks(_ completion: @escaping ([CarPark]) -> Void) {
        do {
            try repo.getData(name: "carparks") { carParks in
                completion(carParks)
            }
        } catch {
            print(error)
        }
    }
}
