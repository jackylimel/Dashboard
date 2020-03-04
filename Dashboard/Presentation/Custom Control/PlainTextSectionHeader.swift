//
//  PlainTextSectionHeader.swift
//  Dashboard
//
//  Created by Jacky Li on 4/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class PlainTextSectionHeader: ReusableView {
    @IBOutlet weak var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }

    private func setupStyle() {
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = ColorPalette.grey
    }

    func configure(with text: String) {
        label.text = text
    }
}
