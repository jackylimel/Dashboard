//
//  UIView+RoundedCorners.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

extension UIView {
    func roundTopCorners(radius: CGFloat = Constants.roundedCornerRadius) {
        layer.cornerRadius = CGFloat(radius)
        clipsToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    func roundBottomCorners(radius: CGFloat = Constants.roundedCornerRadius) {
        layer.cornerRadius = CGFloat(radius)
        clipsToBounds = true
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
