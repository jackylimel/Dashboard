//
//  LectureCell.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class LectureCell: UITableViewCell {
    
    @IBOutlet weak var startHourLabel: UILabel!
    @IBOutlet weak var startPeriodLabel: UILabel!
    @IBOutlet weak var endHourLabel: UILabel!
    @IBOutlet weak var endPeriodLabel: UILabel!
    @IBOutlet weak var verticalSeparator: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classRoomLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var horizontalSeparator: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    private func setupStyle() {
        verticalSeparator.backgroundColor = ColorPalette.blue
        horizontalSeparator.backgroundColor = ColorPalette.veryLight

        startHourLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        startPeriodLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        endHourLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        endPeriodLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        classRoomLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        teacherLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    func config(with model: Model) {
        startHourLabel.text = model.startHour
        startPeriodLabel.text = model.startPeriod
        endHourLabel.text = model.endHour
        endPeriodLabel.text = model.endPeriod
        nameLabel.text = model.name
        classRoomLabel.text = model.classRoom
        teacherLabel.text = model.teacher
    }
}

extension LectureCell {
    struct Model {
        let startHour: String
        let startPeriod: String
        let endHour: String
        let endPeriod: String
        let name: String
        let classRoom: String
        let teacher: String
        let shouldShowRoundedCorner: Bool
    }
}
