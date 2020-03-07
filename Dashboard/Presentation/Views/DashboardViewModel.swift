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

protocol DashboardViewModelDelegate: NSObject {
    func dataLoaded(cellType: CellType)
}

class DashboardViewModel {
    var data: [Int: [CellModel]] = [:]
    weak var delegate: DashboardViewModelDelegate?

    lazy var repo = FirebaseRepository()
    lazy var lectureUseCase = LectureUseCase(repo: repo)
    lazy var shuttleBusUseCase = ShuttleBusUseCase(repo: repo)
    lazy var carParkUseCase = CarParkUseCase(repo: repo)

    func loadData() {
        lectureUseCase.getLectures(limited: Constants.numberOfLectures) { [unowned self] lectures in
            self.mapToCellModel(lectures)
            self.delegate?.dataLoaded(cellType: .lecture)
        }

        shuttleBusUseCase.getBuses(limited: Constants.numberOfShuttleBuses) { [unowned self] shuttleBuses in
            self.mapToCellModel(shuttleBuses)
            self.delegate?.dataLoaded(cellType: .shuttleBus)
        }

        carParkUseCase.getCarParks(limited: Constants.numberOfCarParks) { [unowned self] carParks in
            self.mapToCellModel(carParks)
            self.delegate?.dataLoaded(cellType: .carPark)
        }
    }

    private func mapToCellModel(_ lectures: [Lecture]) {
        data[CellType.lecture.rawValue] = lectures.enumerated().map { index, lecture -> LectureCell.Model in
            return LectureCell.Model(startHour: lecture.start,
                                     startPeriod: lecture.startPeriod,
                                     endHour: lecture.end,
                                     endPeriod: lecture.endPeriod,
                                     name: lecture.name,
                                     classRoom: lecture.classroom,
                                     teacher: lecture.teacher,
                                     hasRoundTopCorners: false,
                                     hasRoundBottomCorners: index == lectures.count - 1)
        }
    }

    private func mapToCellModel(_ shuttleBuses: [ShuttleBus]) {
        self.data[CellType.shuttleBus.rawValue] = shuttleBuses.enumerated().map { index, shuttleBus -> ShuttleBusCell.Model in
            return ShuttleBusCell.Model(from: shuttleBus.from,
                                        to: shuttleBus.to,
                                        minutes: shuttleBus.minutesForNow,
                                        hasRoundTopCorners: index == 0,
                                        hasRoundBottomCorners: index == shuttleBuses.count - 1)
        }
    }

    private func mapToCellModel(_ carParks: [CarPark]) {
        self.data[CellType.carPark.rawValue] = carParks.enumerated().map { index, carPark -> CarParkCell.Model in
            return CarParkCell.Model(name: carPark.name,
                                     count: "\(carPark.availableCount)",
                hasRoundTopCorners: index == 0,
                hasRoundBottomCorners: index == carParks.count - 1)
        }
    }
}
