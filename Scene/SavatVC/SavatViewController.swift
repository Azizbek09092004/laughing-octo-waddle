//
//  DiscountViewcontroller.swift
//  Korzinka-APP task
//
//  Created by islombek on 16/01/24.
//

import UIKit

class SavatViewController: UIViewController {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Savat"
        setupTableView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }

    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(SavatCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
}

extension SavatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SavatCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configureCell(index: indexPath.row)
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

