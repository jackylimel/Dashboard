//
//  UITableViewCell+RoundedCorners.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func setupCorner(with cellModel: CellModel) {
        if cellModel.hasRoundTopCorners || cellModel.hasRoundTopCorners {
            roundFourCorners()
        } else if cellModel.hasRoundBottomCorners {
            roundBottomCorners()
        } else if cellModel.hasRoundTopCorners {
            roundTopCorners()
        }
    }
}
