//
//  StoresViewController.swift
//  Korzinka-APP task
//
//  Created by islombek on 16/01/24.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
      
    let cellIdentifier = "CellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        navigationItem.titleView?.tintColor = .black
        
        view.backgroundColor = .white
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProfileTableViewCell
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = selectedBackgroundView
        cell.backgroundColor = .white
        
        
        switch indexPath.section {
        case 0:
            cell.configureFirstCell()
        case 1...8:
            let selectedCase = indexPath.section - 1
            cell.configureOtherCell(forCase: selectedCase)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            let firstViewController = OrderHistoryViewController()
            navigationController?.pushViewController(firstViewController, animated: true)
        case 2:
            let secondViewController = PromocodesViewController()
            navigationController?.pushViewController(secondViewController, animated: true)
        case 3:
            let secondViewController = InviteFriendViewController()
            navigationController?.pushViewController(secondViewController, animated: true)
        case 4:
            if let url = URL(string: "https://uzumtezkor.uz/ru?utm_source=google&utm_medium=cpc&utm_campaign=TEZKOR_ALWN_B2C_TASH_WEB_DM_GOOGLE_SRCH_BRND_TRAFFIC&utm_content=664713444151&utm_term=uzum%20tezkor&gad_source=1&gclid=CjwKCAiAt5euBhB9EiwAdkXWO8WIYxfrcXDR1DNQaHKnpW8TnjoSDZImagOyjrtd7F2Dq7hTsUgmzBoCURkQAvD_BwE") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            }
        case 5:
            let secondViewController = ChangeLanguageViewController()
            navigationController?.pushViewController(secondViewController, animated: true)
        case 6:
            if let url = URL(string: "https://uzumtezkor.uz/gdpr") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 7:
            if let url = URL(string: "https://uzumtezkor.uz/terms-of-use") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case 8:
            let alertController = UIAlertController(title: "Akkauntdan chiqilsinmi?", message: nil, preferredStyle: .alert)
            let chiqishAction = UIAlertAction(title: "Chiqish", style: .default) { _ in  }
            let bekorQilishAction = UIAlertAction(title: "Bekor qilish", style: .cancel) { _ in }

            alertController.addAction(chiqishAction)
            alertController.addAction(bekorQilishAction)
            present(alertController, animated: true, completion: nil)

        default:
            break
        }
    }

        
        // MARK: - UITableViewDelegate methods
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                return 100
            } else {
                return 50
            }
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 0
        }
        
        
        
    }

