//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

protocol CellModel {}

class DashboardViewController: UIViewController {

    private let lectureUseCase = LectureUseCase()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        setupNavigationBar()
        super.viewDidLoad()

        view.backgroundColor = ColorPalette.background

        tableView.register(cellType: LectureCell.self)
        tableView.register(cellType: ShuttleBusCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorPalette.background
    }

    private func setupNavigationBar() {
        let greetingView = GreetingView(frame: CGRect.zero)
        greetingView.config(with: "Hello", time: "12/3 Friday, Week 8")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: greetingView)

        let searchButtonItem = createNavigationItem(image: .search)
        let profileButtonItem = createNavigationItem(image: .profile)
        navigationItem.rightBarButtonItems = [searchButtonItem, profileButtonItem]
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

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return lectureUseCase.getLectures(within: 0).count
        } else {
            return 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tableView.dequeueCell(ofType: LectureCell.self)
        } else {
            return tableView.dequeueCell(ofType: ShuttleBusCell.self)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else {
            return 50
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return LectureSectionHeader()
        }
        let plainSectionHeader = PlainTextSectionHeader()
        plainSectionHeader.configure(with: "Avaiable car parks")
        return plainSectionHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
