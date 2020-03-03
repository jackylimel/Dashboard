//
//  GreetingView.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class GreetingView: ReusableView {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }

    private func setupStyle() {
        userLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        timeLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        timeLabel.textColor = ColorPalette.grey
    }

    func config(with username: String, time: String) {
        userLabel.text = "Hey, \(username)"
        timeLabel.text = time
    }
}
