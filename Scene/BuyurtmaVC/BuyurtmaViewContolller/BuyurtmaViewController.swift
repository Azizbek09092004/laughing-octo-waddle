//
//  MoreViewController.swift
//  Korzinka-APP task
//
//  Created by islombek on 16/01/24.
//

import UIKit

class BuyurtmaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buyurtma"

        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BuyurtmaCell.self, forCellReuseIdentifier: "BuyurtmaCell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuyurtmaCell", for: indexPath) as! BuyurtmaCell
        cell.configureCell(for: indexPath.row)
        cell.backgroundColor = .white
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let maxWayBillViewController = MaxWayBillViewController()
            navigationController?.pushViewController(maxWayBillViewController, animated: true)
        case 1:
            let beshQozonBillViewController = BeshQozonBillViewController()
            navigationController?.pushViewController(beshQozonBillViewController, animated: true)
        default:
            break
        }
    }
}
