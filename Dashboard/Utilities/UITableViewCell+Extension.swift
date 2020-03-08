//
//  UITableViewCell+Extension.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func setupCorner(with cellModel: CellModel) {
        if cellModel.hasRoundTopCorners && cellModel.hasRoundBottomCorners {
            roundFourCorners()
        } else if cellModel.hasRoundBottomCorners {
            roundBottomCorners()
        } else if cellModel.hasRoundTopCorners {
            roundTopCorners()
        }
    }

    func addDropShadow(widthOffset: Int = 1, heightOffset: Int = 1) {
        layer.shadowOffset = CGSize(width: widthOffset, height: heightOffset)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = Constants.roundedCornerRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false
    }
}
