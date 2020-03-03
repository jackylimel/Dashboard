//
//  UIImage+Extension.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(named name: ImageName) {
        self.init(named: name.rawValue)!
    }
}

enum ImageName: String {
    case busRoute = "busRoute"
    case profile = "profile"
    case search = "search"
}
