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
    @IBOutlet weak var separator: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    private func setupStyle() {
        selectionStyle = .none
        
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        countLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        countLabel.textColor = ColorPalette.blue
        separator.backgroundColor = ColorPalette.separator
    }

    func config(with model: Model) {
        nameLabel.text = model.name
        countLabel.text = model.count
        separator.isHidden = model.hasRoundBottomCorners
        setupCorner(with: model)
    }
}

extension CarParkCell {
    struct Model: CellModel {
        let name: String
        let count: String
        let hasRoundTopCorners: Bool
        let hasRoundBottomCorners: Bool
    }
}
