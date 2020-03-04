//
//  LectureSectionHeader.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class LectureSectionHeader: ReusableView {
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var todayView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }

    private func setupStyle() {
        backgroundColor = .white
        roundTopCorners()

        todayView.layer.cornerRadius = CGFloat(Constants.roundedCornerRadius)
        todayView.clipsToBounds = true
        todayView.layer.maskedCorners = [.layerMaxXMaxYCorner]

        todayLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        addGradientTo(todayView)
    }

    private func addGradientTo(_ view: UIView) {
        let gradientLayer = CAGradientLayer()
        let startColor = UIColor(red: 214.0 / 255.0, green: 125.0 / 255.0, blue: 106.0 / 255.0, alpha: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [startColor.cgColor, UIColor.red.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
