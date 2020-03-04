//
//  DashboardViewModel.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit


protocol CellModel {
    var hasRoundTopCorners: Bool { get }
    var hasRoundBottomCorners: Bool { get }
}

enum CellType: Int {
    case lecture = 0
    case carPark
    case shuttleBus
}

class DashboardViewModel {
    var data: [Int: [CellModel]] = [:]
    let lectureUseCase = LectureUseCase()
    let shuttleBusUseCase = ShuttleBusUseCase()
    let carParkUseCase = CarParkUseCase()

    init() {
        let lectures = lectureUseCase.getLectures(within: 0)
        data[CellType.lecture.rawValue] = lectures.enumerated().map { [unowned self] index, lecture -> LectureCell.Model in
            self.map(lecture: lecture, index: index, totalCount: lectures.count)
        }

        let shuttleBuses = shuttleBusUseCase.getBuses(within: 0)
        data[CellType.shuttleBus.rawValue] = shuttleBuses.enumerated().map { [unowned self] index, shuttleBus -> ShuttleBusCell.Model in
            self.map(shuttleBus: shuttleBus, index: index, totalCount: shuttleBuses.count)
        }

        let carParks = carParkUseCase.getCarParks()
        data[CellType.carPark.rawValue] = carParks.enumerated().map { [unowned self] index, carPark -> CarParkCell.Model in
            self.map(carPark: carPark, index: index, totalCount: carParks.count)
        }
    }

    private func map(lecture: Lecture, index: Int, totalCount: Int) -> LectureCell.Model {
        return LectureCell.Model(startHour: "8:00", startPeriod: "AM", endHour: "10:00", endPeriod: "AM",
                                 name: lecture.name,
                                 classRoom: lecture.classroom,
                                 teacher: lecture.teacher, hasRoundTopCorners: false, hasRoundBottomCorners: index == totalCount - 1)
    }

    private func map(carPark: CarPark, index: Int, totalCount: Int) -> CarParkCell.Model {
        return CarParkCell.Model(name: carPark.name, count: "\(carPark.availableCount)", hasRoundTopCorners: index == 0, hasRoundBottomCorners: index == totalCount - 1)
    }

    private func map(shuttleBus: ShuttleBus, index: Int, totalCount: Int) -> ShuttleBusCell.Model {
        return ShuttleBusCell.Model(from: shuttleBus.from, to: shuttleBus.to, minutes: "123", hasRoundTopCorners: index == 0, hasRoundBottomCorners: index == totalCount - 1)
    }
}
