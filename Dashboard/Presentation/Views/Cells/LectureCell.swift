//
//  LectureCell.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class LectureCell: UITableViewCell {
    
    @IBOutlet weak var startHour: UILabel!
    @IBOutlet weak var startPeriod: UILabel!

    @IBOutlet weak var endHour: UILabel!
    @IBOutlet weak var endPeriod: UILabel!

    @IBOutlet weak var verticalSeparator: UIView!

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var classRoom: UILabel!
    @IBOutlet weak var teacher: UILabel!
    
    @IBOutlet weak var horizontalSeparator: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    private func setupStyle() {
        verticalSeparator.backgroundColor = ColorPalette.blue
        horizontalSeparator.backgroundColor = ColorPalette.veryLight
    }
}
