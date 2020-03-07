//
//  UITableView+Dequeue.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    /// Dequeues a cell for use in a table view using the passed type
    func dequeueCell<T: UITableViewCell>(ofType cellType: T.Type) -> T {
        let cellReuseID = cellType.reuseID
        return dequeueReusableCell(withIdentifier: cellReuseID) as! T
    }

    func register<T: UITableViewCell>(cellType: T.Type) {
        register(UINib(nibName: cellType.nibName, bundle: nil), forCellReuseIdentifier: cellType.reuseID)
    }
}

extension UITableViewCell {

    fileprivate static var nibName: String { reuseID }

    fileprivate static var reuseID: String {
        let className = NSStringFromClass(Self.self as AnyClass)
        return className.split(separator: ".").last.map { String($0) } ?? ""
    }
}
