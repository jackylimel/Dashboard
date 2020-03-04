//
//  ShuttleBusCell.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class ShuttleBusCell: UITableViewCell {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var separator: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    private func setupStyle() {
        selectionStyle = .none

        fromLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        toLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)

        minutesLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        minutesLabel.textColor = ColorPalette.blue

        separator.backgroundColor = ColorPalette.separator
    }
}
