//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    override func viewDidLoad() {
        let greetingView = GreetingView(frame: CGRect.zero)
        greetingView.config(with: "Hello", time: "12/3 Friday, Week 8")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: greetingView)

        let searchButtonItem = createNavigationItem(image: .search)
        let profileButtonItem = createNavigationItem(image: .profile)
        navigationItem.rightBarButtonItems = [searchButtonItem, profileButtonItem]
        super.viewDidLoad()
    }

    @objc func addTapped() {

    }

    private func createNavigationItem(image: ImageName) -> UIBarButtonItem {
        let button: UIButton = UIButton.init(type: .custom)
        button.setImage(UIImage(named: image), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        let buttonItem = UIBarButtonItem(customView: button)
        buttonItem.tintColor = .black
        return buttonItem
    }
}
