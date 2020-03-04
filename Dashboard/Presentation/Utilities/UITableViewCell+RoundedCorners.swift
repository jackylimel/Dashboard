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
        if cellModel.hasRoundTopCorners {
            roundTopCorners()
        }
        if cellModel.hasRoundBottomCorners {
            roundBottomCorners()
        }
    }
}
