//
//  MaxWayBill.swift
//  Uzum Tezkor App
//
//  Created by islombek on 12/02/24.
//

import SwiftUI
import UIKit

class MaxWayBillViewController: UIViewController {

    private let cellIdentifier = "Cell"
    private let headerIdentifier = "HeaderView"

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(HeaderViewmax.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let operButton = UIButton(type: .system)
        operButton.setImage(UIImage(named: "oper"), for: .normal)
        operButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        operButton.addTarget(self, action: #selector(operButtonTapped), for: .touchUpInside)
        let operBarButtonItem = UIBarButtonItem(customView: operButton)
        navigationItem.rightBarButtonItem = operBarButtonItem
    }
    
    @objc func operButtonTapped() {
        if let phoneURL = URL(string: "https://web.telegram.org/a/#6272156503") {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
    }
    
}

extension MaxWayBillViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        cell.selectionStyle = .none
        switch indexPath.section {
        case 0:
            cell.customImageView.image = UIImage(named: "maxxx")
        case 1:
            cell.customImageView.image = UIImage(named: "yetxxx")
        case 2:
            cell.customImageView.image = UIImage(named: "tolovxxx")
        default:
            cell.customImageView.image = UIImage(named: "jamixxx")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.section {
            case 0:
                let savatViewController = SavatViewController()
                   navigationController?.pushViewController(savatViewController, animated: true)
            case 1:
                let latitude = 41.325034569
                let longitude = 69.275733415
                
                if let url = URL(string: "http://maps.apple.com/?ll=\(latitude),\(longitude)") {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:]) { success in
                            if success {
                                print("Opened in Apple Maps")
                            } else {
                                print("Failed to open in Apple Maps")
                            }
                        }
                    } else {
                        print("Apple Maps is not available")
                    }
                }

            case 2:
                let creditCardView = AddCardPage()
                            let hostingController = UIHostingController(rootView: creditCardView)
                            navigationController?.pushViewController(hostingController, animated: true)
            default:
                break
            }
        }
}

extension MaxWayBillViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! HeaderViewmax

        switch section {
        case 0:
            headerView.titleLabel.text = "Max way"
            headerView.minitit.text = "21 dekabr, 13:56 * Yetkazildi"
        case 1:
            headerView.other.text = "Yetkazma tafsilotlari"
        case 2:
            headerView.other.text = "To'lov usuli"
        default:
            headerView.other.text = "Jami"
            headerView.other.font = UIFont.boldSystemFont(ofSize: 40)
        }
        return headerView
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let topSectionHeader = tableView.headerView(forSection: 0)
            let offset = scrollView.contentOffset.y

            if offset <= 0 {
                topSectionHeader?.backgroundColor = .white
            } else {
                topSectionHeader?.backgroundColor = .clear
            }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70     }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 151.1
        case 1, 2:
            return 151.5
        case 3:
            return 450
        default:
            return 0
        }
    }
}


