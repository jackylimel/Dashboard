//
//  CarParkCell.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class CarParkCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    private func setupStyle() {
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        countLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        countLabel.textColor = ColorPalette.blue

        roundFourCorners()
    }
}
