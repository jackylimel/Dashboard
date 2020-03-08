//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Jacky Li on 3/3/20.
//  Copyright © 2020 Jacky Li. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        setupNavigationBar()
        super.viewDidLoad()

        view.backgroundColor = ColorPalette.background

        tableView.register(cellType: LectureCell.self)
        tableView.register(cellType: CarParkCell.self)
        tableView.register(cellType: ShuttleBusCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorPalette.background

        viewModel.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadData()
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

extension DashboardViewController: DashboardViewModelDelegate {
    func dataLoaded(cellType: CellType) {
        tableView.reloadData()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data[section]?.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data.keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueCell(ofType: LectureCell.self)
            if let cellModel = viewModel.data[indexPath.section]?[indexPath.row] as? LectureCell.Model {
                cell.config(with: cellModel)
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueCell(ofType: CarParkCell.self)
            if let cellModel = viewModel.data[indexPath.section]?[indexPath.row] as? CarParkCell.Model {
                cell.config(with: cellModel)
            }
            return cell
        } else {
            let cell = tableView.dequeueCell(ofType: ShuttleBusCell.self)
            if let cellModel = viewModel.data[indexPath.section]?[indexPath.row] as? ShuttleBusCell.Model {
                cell.config(with: cellModel)
            }
            return cell
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
        let title = section == 1 ? "Avaiable car parks" : "Intercampus Shuttle Bus"
        plainSectionHeader.configure(with: title)
        return plainSectionHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.addDropShadow()
        }
    }
}
